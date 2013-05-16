# encoding: utf-8

require 'tabular_code/quwei'

CHAR_CODE = {
  '我' => 4650,
  '爱' => 1614,
  '你' => 3667,
  'あ' => 402,
  'イ' => 504,
  'Ａ' => 333,
  '　' => 101,
  '。' => 103
}

describe TabularCode::Quwei do
  describe '.from_char' do
    it 'converts valid character to corresponding quwei code' do
      CHAR_CODE.each do |i, j|
        TabularCode::Quwei.from_char(i).should == j
      end
    end

    it 'converts invalid character to nil' do
      %w(圡 喆 ℵ 한).each do |i|
        TabularCode::Quwei.from_char(i).should be_nil
      end
    end
  end

  describe '.to_char' do
    it 'converts valid quwei code to corresponding character' do
      CHAR_CODE.each do |i, j|
        TabularCode::Quwei.to_char(j).should == i
      end
    end

    it 'converts invalid quwei code to nil' do
      [-1, 32, 1234, 3600, 9999].each do |i|
        TabularCode::Quwei.to_char(i).should be_nil
      end
    end
  end

  describe '.from_str' do
    it 'converts string to array of quwei codes' do
      TabularCode::Quwei.from_str('榕溶熔').
        should == [7337, 4060, 4059]
    end

    it 'replaces bad characters with nil' do
      TabularCode::Quwei.from_str('镕榕溶熔塎').
        should == [nil, 7337, 4060, 4059, nil]
    end

    it 'replaces bad characters with :replace' do
      TabularCode::Quwei.from_str('镕榕溶熔塎', :replace => -1).
        should == [-1, 7337, 4060, 4059, -1]
    end

    it 'raises error when :replace is empty' do
      ->{ TabularCode::Quwei.from_str('镕榕溶熔塎', {}) }.
        should raise_error(TabularCode::ConversionError)
    end
  end

  describe '.to_str' do
    it 'converts array of quwei codes to string' do
      TabularCode::Quwei.to_str([*1601 .. 1605]).
        should == '啊阿埃挨哎'
    end

    it 'ignores bad codes' do
      TabularCode::Quwei.to_str([*1600 .. 1605]).
        should == '啊阿埃挨哎'
    end

    it 'replaces bad codes with :replace' do
      TabularCode::Quwei.to_str([*1600 .. 1605], :replace => '?').
        should == '?啊阿埃挨哎'
    end

    it 'raises error when :replace is empty' do
      ->{ TabularCode::Quwei.to_str([*1600 .. 1605], {}) }.
        should raise_error(TabularCode::ConversionError)
    end
  end
end
