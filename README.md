# CharCode

Convertion for tabular codes like
Chinese [quwei](http://zh.wikipedia.org/wiki/%E5%8C%BA%E4%BD%8D%E7%A0%81_%28%E5%9B%BD%E6%A0%87%29)
and
Japanese [kuten](http://ja.wikipedia.org/wiki/JIS_X_0208).

## Installation

Add this line to your application's Gemfile:

    gem 'char_code'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install char_code

## Usage

Example program:

    require 'char_code'

    puts Quwei.from_char('搞')
    puts Quwei.to_char(2467)
    p '我爱你！'.quwei
    p Quwei.to_str([4444] * 44)

Example output:

    2467
    搞
    [4650, 1614, 3667, 301]
    "烫烫烫烫"

See rdoc and rspec tests for more details.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
