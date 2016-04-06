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
      if input_options[:age] && input_options[:income] && input_options[:zipcode] && input_options.class == Hash
        response = Unirest.get("http://jsonplaceholder.typicode.com/users?income=#{input_options[:income]}&age=#{input_options[:age]}&zipcode=#{input_options[:zipcode]}&api_token=ENV[API_TOKEN]").body
        # assuming this was the actual endpoint, I'd get this response back
        response = {
          "propensity" => rand.round(5),
          "ranking" => %w(A B C D E F).sample
        }
        @assessment = Assessment.new(response)
        return @assessment
      else
        raise ArgumentError.new("#inquiry takes one hash as an argument and must have keys and values for: age, income, zipcode")
      end
    end
  end
end
