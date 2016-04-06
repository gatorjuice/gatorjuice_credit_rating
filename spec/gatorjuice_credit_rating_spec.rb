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

      it 'raises argument error if parameters are insuffient' do
        expect {
          GatorjuiceCreditRating::Assessment.inquiry(income: 50000)
        }.to raise_error(ArgumentError)
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