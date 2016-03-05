require 'rails_helper'

describe Address do

  describe "@line_1" do
    it { should validate_presence_of(:line_1) }
  end

  describe "@suburb" do
    it { should validate_presence_of(:suburb) }
  end

  describe "@postal_code" do
    it { should validate_presence_of(:postal_code) }
  end

  describe "@state" do
    it { should validate_presence_of(:state) }
  end

  describe "#to_s" do
    subject { Address.new(line_1: "Name").to_s }
    it { should eq("Name") }
  end

end
