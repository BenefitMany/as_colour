require 'pry-byebug'
require 'dotenv'
require_relative '../lib/as_colour'

Dotenv.load('../.env')

auth = {
  subscription_key: ENV['ASCOLOUR_SUBSCRIPTION_KEY'],
  email: ENV['ASCOLOUR_EMAIL'],
  password: ENV['ASCOLOUR_PASSWORD']
}
ascolor_client = AsColour::Client.new(auth)

# =========================================
# Price List
# =========================================
ascolor_client.price_list.each do |price|
  puts price
end

# Set Page Number and Page Size
# =========================================
ascolor_client.price_list(page_number: 2, page_size: 3).each do |price|
  puts price
end
