require "./services/types/base_type"
require "./services/http/open_data_client"

class SirenType < BaseType

  def do_api_update()
    company_state = OpendatasoftClient.get_company_state(@evaluation)
    is_active = company_state == "Actif"
    @evaluation.state = is_active ? "favorable" : "unfavorable"
    @evaluation.reason = is_active ? "company_opened" : "company_closed"
    update_score(100)
  end

  def do_score_update()
    if @evaluation.score >= 50
        update_score(@evaluation.score - 5)
    elsif @evaluation.score <= 50 && @evaluation.score > 0
        update_score(@evaluation.score - 1)
    end
  end
end