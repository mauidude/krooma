require 'spec_helper'

describe Logo do
  context "associations" do
    it { should belong_to :manufacturer }
  end

  context "validations" do
    it { should validate_presence_of :manufacturer_id }

    describe "#url" do
      it { should validate_presence_of :url }
      it { should ensure_length_of(:url).is_at_most(1024)}
    end
  end
end
