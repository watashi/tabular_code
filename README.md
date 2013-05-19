# TabularCode

Convertion for tabular codes like
Chinese [quwei](http://zh.wikipedia.org/wiki/%E5%8C%BA%E4%BD%8D%E7%A0%81_%28%E5%9B%BD%E6%A0%87%29)
and
Japanese [kuten](http://ja.wikipedia.org/wiki/JIS_X_0208).

Supported row-cell notations:

| Module  | Language           | National standard | Alternative name |
|---------|--------------------|-------------------|------------------|
| Quwei   | Simplified Chinese | GB 2312-80        | Quwei 区位       |
| Kuten   | Japanese           | JIS X 0208:1997   | Kuten 区点       |
| KSX1001 | Korean             | KS X 1001:1992    |                  |

## Installation

Add this line to your application's Gemfile:

    gem 'tabular_code'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tabular_code

## Usage

Example program:

    require 'tabular_code'

    puts Quwei.to_str([4444] * 4)
    [Quwei, Kuten, KSX1001].each do |i|
      p [i.from_char('一'), i.to_char(5050)]
    end
    p '我爱你'.quwei
    p '愛してる'.kuten
    p '사랑해요'.ksx1001

Example output:

    烫烫烫烫
    5027	  说
    1676	  傍
    7673	  綱
    [4650, 1614, 3667]
    [1606, 423, 438, 475]
    [2771, 2291, 3956, 3168]

See rdoc and rspec tests for more details.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
