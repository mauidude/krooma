require_relative '../spec_helper'

describe Model do
  subject { FactoryGirl.create :model }

  context "associations" do
    it { should belong_to(:make).class_name("Manufacturer") }
    it { should have_many :trims }
  end

  context "validations" do
    it { should validate_presence_of :make_id }

    describe "#name" do
      it { should validate_presence_of :name }
      it { should ensure_length_of(:name).is_at_most(50) }
    end

    describe "#url_name" do
      it { should validate_presence_of :url_name }
      it { should ensure_length_of(:url_name).is_at_most(50) }
      it { should validate_uniqueness_of(:url_name).case_insensitive }
    end

  end
end
