module AsColour
  class Client
    module InventoryItems
      def items(args = {})
        results = process_request(:get, 'inventory/items', params: args)
        return results if results.is_a?(AsColourError)

        results[:data].map { |row| AsColour::InventoryItem.new(row) }
      end
      alias list_items items

      def item(sku)
        results = process_request(:get, "inventory/items/#{sku}")
        return results if results.is_a?(AsColourError)

        results[:data].map { |row| AsColour::InventoryItem.new(row) }
      end
    end
  end
end
