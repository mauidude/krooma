require 'spec_helper'

describe Condition do
  subject { FactoryGirl.create :condition }

  context "validations" do
    describe "#used" do
      it { should allow_value(true).for(:used) }
      it { should allow_value(false).for(:used) }
      it { should_not allow_value(nil).for(:used)}
    end

    describe "#name" do
      it { should validate_presence_of :name }
      it { should ensure_length_of(:name).is_at_most(50) }
    end

    describe "#url_name" do
      it { should validate_presence_of :url_name }
      it { should ensure_length_of(:url_name).is_at_most(50)}
      it { should validate_uniqueness_of(:url_name).case_insensitive }
    end
  end

end
