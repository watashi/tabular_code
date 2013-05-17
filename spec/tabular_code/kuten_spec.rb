# encoding: utf-8

require 'tabular_code/kuten'

tests = {
  '我' => 1870,
  '愛' => 1606,
  '氷' => 4125,
  '妛' => 5412,
  'あ' => 402,
  'イ' => 504,
  'Ａ' => 333,
  '　' => 101,
  '。' => 103
}

describe TabularCode::Kuten do
  describe '.from_char' do
    it 'converts valid character to corresponding quwei code' do
      tests.each do |i, j|
        TabularCode::Kuten.from_char(i).should == j
      end
    end

    it 'converts invalid character to nil' do
      %w(垚 爱 ℵ 한).each do |i|
        TabularCode::Kuten.from_char(i).should be_nil
      end
    end
  end

  describe '.to_char' do
    it 'converts valid quwei code to corresponding character' do
      tests.each do |i, j|
        TabularCode::Kuten.to_char(j).should == i
      end
    end

    it 'converts invalid quwei code to nil' do
      [-1, 32, 1234, 3600, 9999].each do |i|
        TabularCode::Kuten.to_char(i).should be_nil
      end
    end
  end
end
