require "gatorjuice_credit_rating/version"

module GatorjuiceCreditRating
  class Assessment
    def self.new(options_hash)
      {
        "propensity": 0.26532,
        "ranking": "C"
      }
    end

    def self.test
      5
    end
  end
end
