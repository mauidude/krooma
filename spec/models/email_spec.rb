require 'spec_helper'

describe Email do
  subject { FactoryGirl.create :email }

  context "validations" do
    describe "#email" do
      it { should validate_presence_of :email }
      it { should validate_uniqueness_of(:email).case_insensitive }
      it { should ensure_length_of(:email).is_at_most(50)}
      it { should allow_value("valid@email.com").for(:email) }
      it { should_not allow_value("invalid").for(:email) }
      it { should_not allow_value("invalid@").for(:email) }
      it { should_not allow_value("invalid@asdf").for(:email) }
    end
  end
end
