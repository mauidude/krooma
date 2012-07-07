require 'spec_helper'

describe Manufacturer do
  subject { FactoryGirl.create :manufacturer }

  context "associations" do
    it { should have_many(:models) }
  end

  context "validations" do
    describe "#name" do
      it { should validate_presence_of :name }
      it { should ensure_length_of(:name).is_at_most(50)}
    end

    describe "#url_name" do
      it { should validate_presence_of :url_name }
      it { should validate_uniqueness_of(:url_name).case_insensitive }
      it { should ensure_length_of(:url_name).is_at_most(50)}
    end
  end

  let!(:url_name) { subject.url_name }
  its(:to_param) { should eq url_name }

  pending ".from_param"
  pending ".from_param!"
  pending ".downcase_url_name"
end
