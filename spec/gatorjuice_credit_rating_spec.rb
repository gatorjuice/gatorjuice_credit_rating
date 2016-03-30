require 'spec_helper'

describe GatorjuiceCreditRating do
  it 'has a version number' do
    expect(GatorjuiceCreditRating::VERSION).not_to be nil
  end

  # it 'has a frozen version number' do
  #   version = GatorjuiceCreditRating::VERSION
  #   GatorjuiceCreditRating::VERSION = "0.0.0"
  #   expect(version).to eq(GatorjuiceCreditRating::VERSION)
  # end

  describe GatorjuiceCreditRating::Assessment do
    describe '#self.inquiry' do
      it 'returns a ruby Assessment Object' do
        expect(GatorjuiceCreditRating::Assessment.inquiry(income: 50000, zipcode: 60625, age: 35)).to be_a GatorjuiceCreditRating::Assessment
      end

      it 'alerts the user if params were insufficient' do
        expect(GatorjuiceCreditRating::Assessment.inquiry(income: 50000)).to include("invalid inquiry")
      end

      it 'expects a propensity between 0 and 1' do
        expect(GatorjuiceCreditRating::Assessment.inquiry(income: 50000, zipcode: 60625, age: 35).propensity).to be_between(0, 1).exclusive
      end

      it "expects a ranking between 'A' and 'F'" do
        expect(%w(A B C D E F)).to include(GatorjuiceCreditRating::Assessment.inquiry(income: 50000, zipcode: 60625, age: 35).ranking)
      end
    end
  end
end