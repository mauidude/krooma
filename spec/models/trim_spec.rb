require 'spec_helper'

describe Trim do

  context "associations" do
    it { should belong_to :make }
    it { should belong_to :model }
  end

  context "validations" do
    it { should validate_presence_of :make_id }
    it { should validate_presence_of :model_id }

    describe "#name" do
      it { should validate_presence_of :name }
      it { should ensure_length_of(:name).is_at_most(50)}
    end

    describe "#url_name" do
      subject { FactoryGirl.create :trim }

      it { should validate_presence_of :url_name }
      it { should ensure_length_of(:url_name).is_at_most(50) }
      it { should validate_uniqueness_of(:url_name).case_insensitive }
    end
  end
end
