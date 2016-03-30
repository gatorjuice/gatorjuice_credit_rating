require 'spec_helper'

describe GatorjuiceCreditRating do
  it 'has a version number' do
    expect(GatorjuiceCreditRating::VERSION).not_to be nil
  end

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
    end
  end
end