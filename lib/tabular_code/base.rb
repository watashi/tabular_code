module TabularCode
  class Error < RuntimeError
  end

  class ConversionError < Error
  end

  module Base
    def from_char(c)
      c = c.encode(@encoding).ord rescue (return nil)
      x = c / 0x100 - 0xA0
      y = c % 0x100 - 0xA0
      valid?(x, y) ? x * 100 + y : nil
    end

    def to_char(c)
      x = c / 100
      y = c % 100
      c = valid?(x, y) ? (0xA0 + x) * 0x100 + (0xA0 + y) : nil
      c.chr(@encoding).encode(Encoding::UTF_8) rescue (return nil)
    end

    def from_str(s, options = {:replace => nil})
      ret = s.chars.map{|i| from_char(i)}
      raise ConversionError if !options.has_key?(:replace) && ret.include?(nil)
      ret.map{|i| i.nil? ? options[:replace] : i}
    end

    def to_str(s, options = {:replace => nil})
      ret = s.map{|i| to_char(i)}
      raise ConversionError if !options.has_key?(:replace) && ret.include?(nil)
      ret.map{|i| i.nil? ? options[:replace] : i} * ''
    end

    protected
    def encoding=(encoding)
      @encoding = encoding
    end

    private
    def valid?(x, y)
      (1..94).include?(x) && (1..94).include?(y)
    end
  end
end
