require 'spec_helper'

describe GatorjuiceCreditRating do
  it 'has a version number' do
    expect(GatorjuiceCreditRating::VERSION).not_to be nil
  end

  describe GatorjuiceCreditRating::Assessment do
    describe '#self.new' do
      it 'returns a test JSON response' do
        expect(GatorjuiceCreditRating::Assessment.new(income: 50000, zip: 60625, age: 35)).to eq({"propensity": 0.26532, "ranking": "C"})
      end
    end
  end
end



  # it 'returns a test JSON response' do
  #   expect(GatorjuiceCreditRating::Assessment.new(
  #     income: 50000,
  #     zip: 60625,
  #     age: 35
  #   ).to eq({"propensity" => 0.26532, "ranking" => "C"}) 
  # end
