module AsColour
  class Client
    module Colours
      def colours(args = {})
        results = process_request(:get, 'catalog/colours', params: args)
        return results if results.is_a?(AsColourError)

        results[:data].map { |row| AsColour::Colour.new(row) }
      end
      alias list_colours colours
    end
  end
end
