# frozen_string_literal: true

class Employee < ApplicationRecord
	def self.to_csv
    DownloadEmployeesJob.new.perform(all)
  end
end
