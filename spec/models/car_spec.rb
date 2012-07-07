require_relative '../spec_helper'

describe Car do

  context "associations" do
    it { should belong_to(:make).class_name("Manufacturer") }
    it { should belong_to :model }
    it { should belong_to :trim }
    it { should belong_to :model_year }
    it { should belong_to(:poster).class_name("User") }
    it { should belong_to :condition }
  end

  context "validations" do
    it { should validate_presence_of :make_id }
    it { should validate_presence_of :model_id }
    it { should validate_presence_of :model_year_id }
    it { should validate_presence_of :poster_id }
    it { should validate_presence_of :condition_id }
    it { should validate_presence_of :description }

    describe "#asking_price" do
      it { should validate_presence_of :asking_price }
      it { should validate_numericality_of(:asking_price) }
    end

    describe "#vin" do
      it { should allow_value("WBAUN1C53CVR00511").for(:vin) }
      it { should allow_value("wbaun1c53cvr00511").for(:vin) }
      it { should_not allow_value("1234").for(:vin) }
      it { should_not allow_value("WBAUN1C53CVR00510").for(:vin) }
    end

  end

end
