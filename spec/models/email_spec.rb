require 'spec_helper'

describe Email do
  subject { FactoryGirl.create :email }

  context "validations" do
    describe "#address" do
      it { should validate_presence_of :address }
      it { should validate_uniqueness_of(:address).case_insensitive }
      it { should ensure_length_of(:address).is_at_most(256)}
      it { should allow_value("valid@email.com").for(:address) }
      it { should_not allow_value("invalid").for(:address) }
      it { should_not allow_value("invalid@").for(:address) }
      it { should_not allow_value("invalid@asdf").for(:address) }
    end
  end
end
