# encoding: utf-8

require 'tabular_code/ksx1001'

tests = {
  '我' => 6818,
  '愛' => 6881,
  '안' => 3040,
  '녕' => 1971,
  'あ' => 1002,
  'イ' => 1104,
  'Ａ' => 333,
  '　' => 101,
  '。' => 103
}

describe TabularCode::KSX1001 do
  describe '.from_char' do
    it 'converts valid character to corresponding code' do
      tests.each do |i, j|
        TabularCode::KSX1001.from_char(i).should == j
      end
    end

    it 'converts invalid character to nil' do
      %w(垚 爱 ℵ 펲).each do |i|
        TabularCode::KSX1001.from_char(i).should be_nil
      end
    end
  end

  describe '.to_char' do
    it 'converts valid code to corresponding character' do
      tests.each do |i, j|
        TabularCode::KSX1001.to_char(j).should == i
      end
    end

    it 'converts invalid code to nil' do
      [-1, 32, 1234, 3600, 9999].each do |i|
        TabularCode::KSX1001.to_char(i).should be_nil
      end
    end
  end
end
