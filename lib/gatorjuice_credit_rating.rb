require "gatorjuice_credit_rating/version"
require "unirest"

module GatorjuiceCreditRating
  class Assessment
    attr_reader :propensity, :ranking

    def initialize(input_hash)
      @propensity = input_hash["propensity"].to_f
      @ranking = input_hash["ranking"]
    end

    def self.inquiry(input_options)
      age = input_options[:age].to_s
      income = input_options[:income].to_s
      zipcode = input_options[:zipcode].to_s

      if age && income && zipcode &&
         age.to_i >= 18 && 
         income.to_i > 0 && 
         zipcode.length == 5 && 
         !!Integer(age) && 
         !!Integer(income) &&
         !!Integer(zipcode) && 
         input_options.class == Hash
        response = Unirest.get(
          "https://pacific-stream-61271.herokuapp.com/api/v1/inquiries",
          headers: {
            "Accept" => "application/json"
          },
          parameters: {
            age: age,
            income: income,
            zipcode: zipcode,
            api_token: "ABCDEFG1234567" # ENV[API_TOKEN]
          }
        ).body 
        response["response"] ? response["response"] : Assessment.new(response)
      else
        raise ArgumentError, "#inquiry takes one hash as an argument and must have keys and numeric values for: age, income, zipcode"
      end
    end
  end
end
