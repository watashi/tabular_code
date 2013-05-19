require "tabular_code/version"
require "tabular_code/base"
require "tabular_code/quwei"
require "tabular_code/kuten"
require "tabular_code/ksx1001"

Quwei = TabularCode::Quwei
Kuten = TabularCode::Kuten
KSX1001 = TabularCode::KSX1001

class String
  # Returns an Array of quwei codes
  def quwei
    Quwei.from_str self
  end

  # Returns an Array of kuten codes
  def kuten
    Kuten.from_str self
  end

  # Returns an Array of ksx1001 codes
  def ksx1001
    KSX1001.from_str self
  end
end
