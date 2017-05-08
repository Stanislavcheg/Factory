class Factory

  def self.new (*args, &block)
    Class.new do
      attr_accessor  *args
      define_method(:initialize) do |*params|
        params.each_with_index { |param, i| instance_variable_set("@#{args[i]}", params[i])}
      end

	  define_method :[] do |arg|
	    if arg.kind_of?(Integer)
	      instance_variable_get(instance_variables[arg])
	    else
	      instance_variable_get("@#{arg}")
	    end
	  end

	  class_eval(&block) if block_given?
	end
  end
end