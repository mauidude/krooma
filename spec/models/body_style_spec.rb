require 'spec_helper'

describe BodyStyle do
  subject { FactoryGirl.create :body_style }

  context "validations" do
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
