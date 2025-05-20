# ASColour

This gem is a wrapper for the ASColour API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'as_colour'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install ascolour

## Usage

```ruby
require 'as_colour'

auth = {
  subscription_key: ENV['ASCOLOUR_SUBSCRIPTION_KEY']
}

client = AsColour::Client.new(auth)

client.colours.each do |colour|
  puts colour
end
```

## Development

### Local Development using RVM

You will need to add a .env file to the root of the project with the following variables:

```
ASCOLOUR_SUBSCRIPTION_KEY=your_access_key
```

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

### Local Development using Docker

You can also use Docker to develop the gem. To do this, you will need to have Docker installed on your machine.

To get started, you will need to build the Docker image:

```
docker compose build
```

After the image is built, you can run the following command to start the container. Note that
you will want to do this in its own terminal window so you can attach to the container.

```
docker compose up
```

You will see "Attaching to ascolour" in the output. This means the container is running and you can now run the following command to attach to the container:

```
docker exec -it ascolour bash
```

To stop the container, you can run the following command:

```
docker compose down
```

# Rebuild Gemfile.lock

```
docker compose run ascolour bundle install
```

## Implemented Endpoints

- Catalog
  - Colours
    - List: `GET /catalog/colours`
  - Products
    - List: `GET /catalog/products`
    - Item: `GET /catalog/products/{style_code}`
    - Images: `GET /catalog/products/{style_code}/images`
  - Product Variants
    - List: `GET /catalog/products/{style_code}/variants`
    - Item: `GET /catalog/products/{style_code}/variants/{variant_id}`
    - Inventory: `GET /catalog/products/{style_code}/variants/{variant_id}/inventory`
    - Inventory Inbound: `GET /catalog/products/{style_code}/variants/{variant_id}/inbound`
  - Price List
    - List: `GET /price-list`
- Inventory
  - Items: `GET /inventory/items`
  - Item: `GET /inventory/items/{sku}`

## TODO Endpoints

All known endpoints have been implemented. If you know of any endpoints that are not listed above, please open an issue or a pull request.

## Limitations

In order to use the ASColour API you must first have a ASColour account. At this time, ASColour does not offer a sandbox environment for testing, so you will need to reach out to them about getting access your account data.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/BenefitMany/ascolour. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/BenefitMany/ascolour/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ascolour project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/BenefitMany/ascolour/blob/main/CODE_OF_CONDUCT.md).
