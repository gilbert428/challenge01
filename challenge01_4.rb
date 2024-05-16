# Program by:Gilbert Lagman
# Date : May 15, 2024
# Description : Using open data

require 'net/http'
require 'json'

url = 'https://data.winnipeg.ca/resource/d3jk-hb6j.json?$limit=306000'


def get_tree_data(url)
  uri = URI(url)
  response = Net::HTTP.get(uri)
  JSON.parse(response)
end



def count_ash_trees(tree_data)
  ash_tree_count = 0

  tree_data.each do |tree|
    if tree['common_name']&.downcase&.include?('ash')
      ash_tree_count += 1
    elsif tree['scientific_name']&.downcase&.include?('fraxinus')
      ash_tree_count += 1
    end
  end

  ash_tree_count

end

url = 'https://data.winnipeg.ca/resource/d3jk-hb6j.json?$limit=306000'

# Retrieve tree data from the subset URL
tree_data = get_tree_data(url)

# Count Ash trees
ash_count = count_ash_trees(tree_data)
puts "Number of Ash trees in Winnipeg: #{ash_count}"
