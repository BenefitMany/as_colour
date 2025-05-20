module AsColour
  class Client
    module Products
      def products(args = {})
        results = process_request(:get, 'catalog/products', params: args)
        return results if results.is_a?(AsColourError)

        results[:data].map { |row| AsColour::Product.new(row) }
      end
      alias list_products products

      def product(style_code)
        result = process_request(:get, "catalog/products/#{style_code}")
        return result if result.is_a?(AsColourError)

        AsColour::Product.new(result)
      end

      def product_images(style_code)
        results = process_request(:get, "catalog/products/#{style_code}/images")
        return results if results.is_a?(AsColourError)

        results[:data].map { |row| AsColour::ProductImage.new(row) }
      end
    end
  end
end
