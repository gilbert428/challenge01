# Program by:Gilbert Lagman
# Date : May 15, 2024
# Description : Script that uses the JSON provided by the dog.ceo API to print out a nicely formatted list of dog breeds and sub-breeds.

require 'net/http'
require 'json'

url = 'https://dog.ceo/api/breeds/list/all'
uri = URI(url)
response = Net::HTTP.get(uri)
dog_breeds = JSON.parse(response)

puts " Dog Breeds and Sub-Breeds "
puts "-----------------------------"

dog_breeds['message'].each do |breed, sub_breeds|
  if sub_breeds.empty?
    puts "* #{breed}"
  else
    puts "* #{breed}"
    sub_breeds.each do |sub_breed|
      puts "  * #{sub_breed}"
    end
  end
end
