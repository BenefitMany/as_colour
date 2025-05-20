module AsColour
  class Client
    module ProductVariants
      def product_variants(style_code, args = {})
        results = process_request(:get, "catalog/products/#{style_code}/variants", params: args)
        return results if results.is_a?(AsColourError)

        results[:data].map { |row| AsColour::Product.new(row) }
      end

      def product_variant(style_code, variant_id)
        result = process_request(:get, "catalog/products/#{style_code}/variants/#{variant_id}")
        return result if result.is_a?(AsColourError)

        AsColour::Product.new(result)
      end

      def product_variant_inventory(style_code, variant_id)
        results = process_request(:get, "catalog/products/#{style_code}/variants/#{variant_id}/inventory")
        return results if results.is_a?(AsColourError)

        results[:data].map { |row| AsColour::ProductInventory.new(row) }
      end

      def product_variant_inventory_inbound(style_code, variant_id)
        result = process_request(:get, "catalog/products/#{style_code}/variants/#{variant_id}/inbound")
        return result if result.is_a?(AsColourError)

        AsColour::Product.new(result)
      end
    end
  end
end
