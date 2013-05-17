require "tabular_code/version"
require "tabular_code/base"
require "tabular_code/quwei"
require "tabular_code/kuten"

Quwei = TabularCode::Quwei
Kuten = TabularCode::Kuten

class String
  def quwei
    Quwei.from_str self
  end

  def kuten
    Kuten.from_str self
  end
end
