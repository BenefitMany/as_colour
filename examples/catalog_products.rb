require 'pry-byebug'
require 'dotenv'
require_relative '../lib/as_colour'

Dotenv.load('../.env')

auth = {
  subscription_key: ENV['ASCOLOUR_SUBSCRIPTION_KEY']
}
ascolor_client = AsColour::Client.new(auth)

# =========================================
# Products List
# =========================================

ascolor_client.products.each do |colour|
  puts colour
end

# Filter by color name
# =========================================
ascolor_client.colours(colour_filter: 'red').each do |colour|
  puts colour
end

# Variant List
# =========================================
ascolor_client.product_variants('1001').each do |variant|
  puts variant
end

# Variant Item
# =========================================
ascolor_client.product_variant('1001', '1001-BLACK-P-OS').each do |inventory|
  puts inventory
end

# Variant Inventory
# =========================================
ascolor_client.product_variant_inventory('1001', '1001-BLACK-P-OS').each do |inventory|
  puts inventory
end

# Variant Inventory Inbound (NOT WORKING)
# =========================================
# ascolor_client.product_variant_inventory_inbound('1001', '1001-BLACK-P-OS').each do |inventory|
#   puts inventory
# end

# Product Images
# =========================================
ascolor_client.product_images('1001').each do |variant|
  puts variant
end
