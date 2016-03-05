require 'rails_helper'

describe State do

  describe "@name" do
    it { should validate_presence_of(:name) }
    describe "validating uniqueness" do
      subject { FactoryGirl.create(:state) }
      it { should validate_uniqueness_of(:name) }
    end
  end

  describe "@abbreviation" do
    it { should validate_presence_of(:abbreviation) }
    describe "validating uniqueness" do
      subject { FactoryGirl.create(:state) }
      it { should validate_uniqueness_of(:abbreviation) }
    end
  end

  describe "#to_s" do
    subject { State.new(name: "Name").to_s }
    it { should eq("Name") }
  end

end
