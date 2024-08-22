class FakeVatClient
  class << self 
    def get_company_state(evaluation)
      data = [
        { state: "favorable", reason: "company_opened" },
        { state: "unfavorable", reason: "company_closed" },
        { state: "unconfirmed", reason: "unable_to_reach_api" },
        { state: "unconfirmed", reason: "ongoing_database_update" },
      ].sample
      data
    end
  end
end