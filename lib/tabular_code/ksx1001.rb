require "tabular_code/base"

module TabularCode
  # KSX1001 code.
  #
  # [Language] Korean
  # [National standard] KS X 1001:1992
  # [Size] 8224 characters (2350 hangul, 4888 hanja)
  # [Layout]
  #   * *01-02* General graphic characters (163 characters)
  #   * *03* Full-width ASCII characters (94 characters)
  #   * *04* Hangul letters (94 characters)
  #   * *05* Roman numerals (20 characters) and Greek letters (48 characters)
  #   * *06* Box drawing characters (68 characters)
  #   * *07* Units of measurement (79 characters)
  #   * *08* Latin capital letters (11 characters), ordinal indicator (2 characters), circled characters (69 characters) and vulgar fractions (9 characters)
  #   * *09* Latin small letters (16 characters), parenthesized characters (69 characters), superscripts (5 characters) and subscripts (4 characters)
  #   * *10* Hiragana (83 characters)
  #   * *11* Katakana (86 characters)
  #   * *12* Cyrillic letters (66 characters)
  #   * *16-40* Hangul characters (2350 characters)
  #   * *41* User-definable positions (94 positions)
  #   * *42-93* Hanja characters (4888 characters),
  #     with 268 duplicate hanja
  #   * *94* User-definable positions (94 positions)
  #   * Empty positions (424 positions)
  module KSX1001
    extend Base

    self.encoding = Encoding::EUC_KR
  end
end
