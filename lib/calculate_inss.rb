# frozen_string_literal: true

class CalculateInss
  def initialize(salary)
    @salary = salary
  end

  def result
    brackets = [
      { limit: 1412.00, rate: 0.075 },
      { limit: 2666.68, rate: 0.09 },
      { limit: 4000.03, rate: 0.12 },
      { limit: 7786.02, rate: 0.14 }
    ]

    contribution = 0.0
    remaining_salary = @salary

    brackets.each_with_index do |bracket, index|
      limit = bracket[:limit]
      rate = bracket[:rate]
      previous_limit = index.zero? ? 0 : brackets[index - 1][:limit]

      next unless @salary > previous_limit

      calculation_base = [remaining_salary, limit - previous_limit].min
      contribution += calculation_base * rate
      remaining_salary -= calculation_base
    end

    contribution += (@salary - brackets.last[:limit]) * brackets.last[:rate] if @salary > brackets.last[:limit]

    contribution.round(2)
  end
end
