# frozen_string_literal: true

class Employee < ApplicationRecord # rubocop:disable Style/Documentation
  validates :name, presence: true
  validates :salary, presence: true

  before_save :validate_discount_inss

  def self.to_csv
    DownloadEmployeesJob.new.perform(all)
  end

  private

  def validate_discount_inss
    return unless discount_inss.blank?

    self.discount_inss = CalculateInss.new(salary).result
  end
end
