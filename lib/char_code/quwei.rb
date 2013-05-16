require "char_code/base"

module CharCode
  module Quwei
    extend Base

    def self.valid?(hi, lo)
      (1..87).include?(hi) && (1..94).include?(lo)
    end

    def self.from_char(c)
      c = c.encode(Encoding::EUC_CN).ord rescue (return nil)
      hi = (c >> 8) - 0xA0
      lo = (c & 0xff) - 0xA0
      valid?(hi, lo) ? hi * 100 + lo : nil
    end

    def self.to_char(c)
      hi = 0xA0 + (c / 100)
      lo = 0xA0 + (c % 100)
      c = valid?(c / 100, c % 100) ? (hi << 8) ^ lo : nil
      c.chr(Encoding::EUC_CN).encode(Encoding::UTF_8) rescue (return nil)
    end
  end
end
