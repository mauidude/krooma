require 'spec_helper'

describe ModelYear do
  subject { FactoryGirl.create :model_year }
  describe "associations" do
    it { should have_and_belong_to_many :models }
  end

  describe "validations" do
    context "#year" do
      it { should validate_presence_of :year }
      it { should validate_numericality_of(:year) }
      it { should_not allow_value(2012.0).for(:year) }
      it { should allow_value(1900).for(:year)}
      it { should_not allow_value(1899).for(:year)}
      it { should allow_value(2020).for(:year)}
      it { should_not allow_value(2021).for(:year)}
    end
  end

  let!(:year) { subject.year }
  its(:to_param) { should eq year }
end
