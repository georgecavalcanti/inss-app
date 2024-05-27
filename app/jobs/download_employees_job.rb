require 'csv'

class DownloadEmployeesJob < ApplicationJob
  queue_as :default

  def perform(all)
    attributes = %w{
			id name document birthdate phone_number salary
			discount_inss address address_neighborhood address_number
			address_city address_state address_zip_code
		}

    CSV.generate(headers: true) do |csv|
      csv << attributes
      all.each do |employee|
        csv << employee.attributes.values_at(*attributes)
      end
    end
  end
end
