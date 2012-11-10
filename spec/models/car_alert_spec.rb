require 'spec_helper'

describe CarAlert do
  subject { FactoryGirl.create :car_alert }

  context "associations" do
    it { should belong_to :email }
  end

  context "validations" do
    it { should validate_presence_of :email_id }
    it { should validate_presence_of :search }
  end

  describe "#verify" do
    its(:verified_at) { should be_nil }

    context "when unverified" do
      before { subject.verify }

      its(:verified_at) { should_not be_nil }
    end
  end
end
