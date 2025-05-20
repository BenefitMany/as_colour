module AsColour
  class Client
    module PriceList
      def price_list(args = {})
        args.merge!(auth_token_required: true)
        results = process_request(:get, 'catalog/pricelist', params: args)
        return results if results.is_a?(AsColourError)

        results[:data].map { |row| AsColour::PriceListItem.new(row) }
      end
    end
  end
end
