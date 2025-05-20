require 'pry-byebug'
require 'dotenv'
require_relative '../lib/as_colour'

Dotenv.load('../.env')

auth = {
  subscription_key: ENV['ASCOLOUR_SUBSCRIPTION_KEY']
}
ascolor_client = AsColour::Client.new(auth)

# =========================================
# Items List
# =========================================
ascolor_client.items.each do |item|
  puts item
end

# Item by SKU
# =========================================
ascolor_client.item('1001-BLACK-P-OS').each do |item|
  puts item
end
