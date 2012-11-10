require 'spec_helper'

describe Feature do
  context "associations" do
    it { should have_and_belong_to_many(:cars)}
  end

  context "validations" do
    describe "#name" do
      it { should validate_presence_of :name}
      it { should ensure_length_of(:name).is_at_most(50)}
      it { should validate_uniqueness_of(:name).case_insensitive}
    end
  end
end
