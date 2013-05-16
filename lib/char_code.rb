require "char_code/version"
require "char_code/base"
require "char_code/quwei"

Quwei = CharCode::Quwei

class String
  def quwei
    Quwei.from_str self
  end
end
