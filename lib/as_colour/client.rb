require_relative 'client/colours'
require_relative 'client/products'
require_relative 'client/product_variants'
require_relative 'client/inventory_items'
require_relative 'client/price_list'

require_relative 'model/as_colour_model'
require_relative 'model/colour'
require_relative 'model/inventory_item'
require_relative 'model/price_list_item'
require_relative 'model/product'
require_relative 'model/product_image'
require_relative 'model/product_inventory'
require_relative 'model/product_variant'

module AsColour
  class Client
    include AsColour::Client::Colours
    include AsColour::Client::Products
    include AsColour::Client::ProductVariants
    include AsColour::Client::InventoryItems
    include AsColour::Client::PriceList

    def initialize(auth = nil)
      @auth = auth || load_from_environment

      if @auth.nil?
        raise AsColourError, 'API authentication incomplete! You need the subscription key.'
      end
    end

    private

    def as_colour_auth_headers(auth_token_required)
      retval = {
        'Content-Type' => 'application/json',
        'charset' => 'utf-8',
        'Subscription-Key' => @auth[:subscription_key]
      }
      retval['Authorization'] = "Bearer #{process_auth_token_request}" if auth_token_required
      retval
    end

    def load_from_environment
      return if ENV['ASCOLOUR_SUBSCRIPTION_KEY'].nil?

      {
        subscription_key: ENV['ASCOLOUR_SUBSCRIPTION_KEY'],
        email: ENV['ASCOLOUR_EMAIL'],
        password: ENV['ASCOLOUR_PASSWORD']
      }
    end

    def process_as_colour_response(response_body)
      JSON.parse(response_body, symbolize_names: true).to_snake_keys
    rescue
      response_body
    end

    def process_auth_token_request
      request_params = {
        method: :post,
        headers: as_colour_auth_headers(nil),
        body: {
          email: @auth[:email],
          password: @auth[:password]
        }.to_json
      }

      proxy = @auth[:proxy] || ENV['PROXY']
      request_params[:proxy] = proxy unless proxy.nil?

      response = Typhoeus::Request.new(
        "https://api.ascolour.com/v1/api/authentication",
        request_params
      ).run
      return AsColourError.new(response) unless response.success?

      retval = process_as_colour_response(response.body)
      retval[:token]
    end

    def process_request(request_type, url_path, options = {})
      options_params = options[:params] || {}
      auth_token_required = options_params.delete(:auth_token_required) || false
      request_params = {
        method: request_type,
        params: options_params.to_camelback_keys,
        headers: as_colour_auth_headers(auth_token_required),
        body: options[:body]&.to_json
      }

      proxy = @auth[:proxy] || ENV['PROXY']
      request_params[:proxy] = proxy unless proxy.nil?

      response = Typhoeus::Request.new(
        "https://api.ascolour.com/v1/#{url_path}",
        request_params
      ).run
      return AsColourError.new(response) unless response.success?

      process_as_colour_response(response.body)
    end
  end
end