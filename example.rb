require_relative "factory"

Customer1 = Factory.new(:name, :address, :zip)

joe = Customer1.new('Joe Smith', '123 Maple, Anytown NC', 12345)

puts joe.name 
puts joe['name'] 
puts joe[:name]  
puts joe[0]      

Customer2 = Factory.new(:name, :address) do
  def greeting
    "Hello #{name}!"
  end
end

dave = Customer2.new('Dave', '123 Main')

puts dave.greeting