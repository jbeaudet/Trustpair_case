require "json"
require "net/http"
require "./services/evaluator"

class TrustIn
  def initialize(evaluations)
    @evaluations = evaluations
  end

  def update_score()
    Evaluator.new(@evaluations).evaluate()
  end
end

class Evaluation
  attr_accessor :type, :value, :score, :state, :reason

  def initialize(type:, value:, score:, state:, reason:)
    @type = type
    @value = value
    @score = score
    @state = state
    @reason = reason
  end

  def to_s()
    "#{@type}, #{@value}, #{@score}, #{@state}, #{@reason}"
  end
end

