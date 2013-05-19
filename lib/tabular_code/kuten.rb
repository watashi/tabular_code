require "tabular_code/base"

module TabularCode
  # Kuten code.
  #
  # [Language] Japanese
  # [National standard] JIS X 0208:1997
  # [Size] 6879 characters (6355 kanji)
  # [Layout]
  #   * *01-02* Special characters (147 characters)
  #   * *03* Digits (10 characters) and Latin letters (52 characters)
  #   * *04* Hiragana (83 characters)
  #   * *05* Katakana (86 characters)
  #   * *06* Greek letters (48 characters)
  #   * *07* Cyrillic letters (66 characters)
  #   * *08* Box drawing characters (32 characters)
  #   * *16-47* The kanji in level 1, arranged according to
  #     representative reading (2965 characters)
  #   * *48-84* The kanji in level 2, arranged according to
  #     primary radical and stroke count (3390 characters)
  module Kuten
    extend Base

    self.encoding = Encoding::EUC_JP
  end
end
