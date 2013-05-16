require "tabular_code/version"
require "tabular_code/base"
require "tabular_code/quwei"

Quwei = TabularCode::Quwei

class String
  def quwei
    Quwei.from_str self
  end
end
