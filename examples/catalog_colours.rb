require 'pry-byebug'
require 'dotenv'
require_relative '../lib/as_colour'

Dotenv.load('../.env')

auth = {
  subscription_key: ENV['ASCOLOUR_SUBSCRIPTION_KEY']
}
ascolor_client = AsColour::Client.new(auth)

# =========================================
# Colours List
# =========================================
ascolor_client.colours.each do |colour|
  puts colour
end

# Filter by color name
# =========================================
ascolor_client.colours(colour_filter: 'red').each do |colour|
  puts colour
end
