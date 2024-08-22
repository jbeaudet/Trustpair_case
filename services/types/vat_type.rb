require "./services/types/base_type"
require "./services/http/fake_vat_client"

class VatType < BaseType

  def do_api_update()
      data = FakeVatClient.get_company_state(@evaluation)
      @evaluation.state = data[:state]
      @evaluation.reason = data[:reason]
      update_score(100)
  end

  def do_score_update()
    if @evaluation.score >= 50
        update_score(@evaluation.score - 1)
    elsif @evaluation.score <= 50 && @evaluation.score > 0
        update_score(@evaluation.score - 3)
    end
  end
end