require "./services/types/siren_type"
require "./services/types/vat_type"

class Evaluator

  def initialize(evaluations)
    @evaluations = evaluations
  end

  def evaluate()
    @evaluations.each do |evaluation|
      next if evaluation.state == "unfavorable"

      type = initialize_type(evaluation)

      process_evaluation(type)
    end
  end

  def initialize_type(evaluation)
    case evaluation.type
    when "SIREN"
       SirenType.new(evaluation)
    when "VAT"
       VatType.new(evaluation)
    else
      raise "Unsupported evaluation type: #{evaluation.type}"
    end
  end

  def process_evaluation(type)
    if type.need_api_update?
      type.do_api_update
    elsif type.need_score_update?
      type.do_score_update
    else
      type.do_fav_update
    end
  end

end