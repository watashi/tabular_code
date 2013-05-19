require "tabular_code/base"

module TabularCode
  # Quwei code.
  #
  # [Language] Simplified Chinese
  # [National standard] GB 2312-80
  # [Size] 7445 characters (6763 Chinese characters)
  # [Layout]
  #   * *01* Comprising punctuation and other special characters (94 characters)
  #   * *02* Numerals (72 characters)
  #   * *03* Full-width ASCII characters (94 characters)
  #   * *04* Hiragana (83 characters)
  #   * *05* Katakana (86 characters)
  #   * *06* Greek letters (48 characters)
  #   * *07* Cyrillic letters (66 characters)
  #   * *08* Pinyin (26 characters) and Bopomofo (37 characters)
  #   * *09* Box drawing characters (76 characters)
  #   * *16-55* the first plane for Chinese characters,
  #     arranged according to pinyin (3755 characters)
  #   * *56-87* the second plane for Chinese characters,
  #     arranged according to radical and strokes (3008 characters)
  module Quwei
    extend Base

    self.encoding = Encoding::EUC_CN
  end
end
