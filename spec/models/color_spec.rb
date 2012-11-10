require 'spec_helper'

describe Color do
  context "validations" do
    describe "#external" do
      it { should allow_value(true).for(:external) }
      it { should allow_value(true).for(:external) }
      it { should_not allow_value(nil).for(:external) }
    end

    describe "#name" do
      subject { FactoryGirl.create :exterior_color }

      it { should validate_presence_of :name}
      it { should ensure_length_of(:name).is_at_most(50)}
      it { should validate_uniqueness_of(:name).case_insensitive.scoped_to(:external) }
    end
  end
end
