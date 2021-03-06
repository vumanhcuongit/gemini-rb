module Gemini
  module Orders
    def self.create(options = {})
      Gemini.sanity_check!
      result = Gemini::Net.post("/v1/order/new", options)
      Gemini::Order.new(JSON.parse(result))
    end

    def self.cancel(options = {})
      Gemini.sanity_check!
      Gemini::Net.post("/v1/order/cancel", options)
    end

    def self.cancel_all(options = {})
      Gemini.sanity_check!
      Gemini::Net.post("/v1/order/cancel/all", options)
    end
  end
end
