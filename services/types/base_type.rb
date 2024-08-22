class BaseType
  UNFAVORABLE_STATE = "unfavorable"
  UNCONFIRMED_STATE = "unconfirmed"
  ONGOING_DATABASE_UPDATE_REASON = "ongoing_database_update"
  UNABLE_TO_REACH_API_REASON = "unable_to_reach_api"
  
  attr_reader :evaluation

  def initialize(evaluation)
    @evaluation = evaluation
  end

  def do_api_update
    raise NotImplementedError, "You must implement the do_api_update method"
  end

  def do_score_update
    raise NotImplementedError, "You must implement the do_score_update method"
  end

  def need_api_update?
    score_needs_update = (@evaluation.score == 0 && @evaluation.state != UNFAVORABLE_STATE)
    state_needs_update = (@evaluation.state == UNCONFIRMED_STATE && @evaluation.reason == ONGOING_DATABASE_UPDATE_REASON)
    score_needs_update || state_needs_update
  end

  def need_score_update?
    @evaluation.reason == UNABLE_TO_REACH_API_REASON && @evaluation.state == UNCONFIRMED_STATE
  end

  def update_score(new_score)
    @evaluation.score = [new_score, 0].max
  end

  def do_fav_update
    update_score(@evaluation.score - 1)
  end
end