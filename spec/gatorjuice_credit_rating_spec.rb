require 'spec_helper'
require 'unirest'

GJCRA = GatorjuiceCreditRating::Assessment

describe GatorjuiceCreditRating do
  it 'has a version number' do
    expect(GatorjuiceCreditRating::VERSION).not_to be nil
  end

  describe GJCRA do
    describe '#self.inquiry' do
      it 'returns a ruby Assessment Object' do
        expect(
          GJCRA.inquiry(
            income: 50000, 
            zipcode: 60625, 
            age: 35
          )
        ).to be_a GJCRA
      end

      it 'raises argument error if parameters are insuffient' do
        expect { GJCRA.inquiry(income: 50000) }.to raise_error(ArgumentError)
      end

      it 'expects a propensity between 0 and 1' do
        inquiry = GJCRA.inquiry(
          income: 50000,
          zipcode: 60625, 
          age: 35
        )
        expect(inquiry.propensity).to be_between(0, 1).exclusive
      end

      it "expects a ranking between 'A' and 'F'" do
        inquiry = GJCRA.inquiry(
          income: 50000,
          zipcode: 60625, 
          age: 35
        )
        expect(%w(A B C D E F)).to include(
          GJCRA.inquiry(
            income: 50000, 
            zipcode: 60625, 
            age: 35
          ).ranking
        )
      end

      it 'sends a message back if the server doesn\'t detect an age parameter' do
        response = Unirest.post(
          "https://pacific-stream-61271.herokuapp.com/api/v1/inquiries",
          headers: {
            "Accept" => "application/json"
          },
          parameters: {
            income: "32342",
            zipcode: "60625",
            api_token: "ABCDEFG1234567" # ENV[API_TOKEN]
          }
        ).body 
        expect(response).to eq({"response" => "missing age parameter"})
      end

      it 'sends a message back if the server doesn\'t detect an income parameter' do
        response = Unirest.post(
          "https://pacific-stream-61271.herokuapp.com/api/v1/inquiries",
          headers: {
            "Accept" => "application/json"
          },
          parameters: {
            age: "35",
            zipcode: "60625",
            api_token: "ABCDEFG1234567" # ENV[API_TOKEN]
          }
        ).body 
        expect(response).to eq({"response" => "missing income parameter"})
      end

      it 'sends a message back if the server doesn\'t detect a zipcode parameter' do
        response = Unirest.post(
          "https://pacific-stream-61271.herokuapp.com/api/v1/inquiries",
          headers: {
            "Accept" => "application/json"
          },
          parameters: {
            age: "35",
            income: "32342",
            api_token: "ABCDEFG1234567" # ENV[API_TOKEN]
          }
        ).body 
        expect(response).to eq({"response" => "missing zipcode parameter"})
      end
    end
  end
end