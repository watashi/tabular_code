module CharCode
  class Error < RuntimeError
  end

  class ConversionError < Error
  end

  module Base
    def from_str(s, options = {:replace => nil})
      ret = s.chars.map{|i| self.from_char(i)}
      raise ConversionError if !options.has_key?(:replace) && ret.include?(nil)
      ret.map{|i| i.nil? ? options[:replace] : i}
    end

    def to_str(s, options = {:replace => nil})
      ret = s.map{|i| self.to_char(i)}
      raise ConversionError if !options.has_key?(:replace) && ret.include?(nil)
      ret.map{|i| i.nil? ? options[:replace] : i} * ''
    end
  end
end
