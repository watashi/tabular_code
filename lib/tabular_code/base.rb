module TabularCode
  class Error < RuntimeError
  end

  # Raised when conversion fails.
  class ConversionError < Error
  end

  module Base
    # Converts a character to corresponding row-cell notation.
    #
    # Returns +nil+ if no such notation exists.
    def from_char(c)
      c = c.encode(@encoding).ord rescue (return nil)
      x = c / 0x100 - 0xA0
      y = c % 0x100 - 0xA0
      valid?(x, y) ? x * 100 + y : nil
    end

    # Converts a row-cell notation to corresponding character.
    #
    # Returns +nil+ if no such character exists.
    def to_char(c)
      x = c / 100
      y = c % 100
      c = valid?(x, y) ? (0xA0 + x) * 0x100 + (0xA0 + y) : nil
      c.chr(@encoding).encode(Encoding::UTF_8) rescue (return nil)
    end

    # Converts a String to an Array of row-cell notations.
    #
    # If +:replace+ is given, replaces undefined characters with +:replace+.
    # Otherwise, raises ConversionError for undefined characters.
    def from_str(s, options = {:replace => nil})
      ret = s.chars.map{|i| from_char(i)}
      raise ConversionError if !options.has_key?(:replace) && ret.include?(nil)
      ret.map{|i| i.nil? ? options[:replace] : i}
    end

    # Converts an Array of row-cell notations to a String.
    #
    # If +:replace+ is given, replaces undefined characters with +:replace+.
    # Otherwise, raises ConversionError for undefined characters.
    def to_str(s, options = {:replace => nil})
      ret = s.map{|i| to_char(i)}
      raise ConversionError if !options.has_key?(:replace) && ret.include?(nil)
      ret.map{|i| i.nil? ? options[:replace] : i} * ''
    end

    protected
    # :nodoc:
    def encoding=(encoding)
      @encoding = encoding
    end

    private
    # :nodoc:
    def valid?(x, y)
      (1..94).include?(x) && (1..94).include?(y)
    end
  end
end
