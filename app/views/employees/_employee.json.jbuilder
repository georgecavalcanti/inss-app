json.extract! employee, :id, :name, :birthdate, :address, :address_number, :address_neighborhood, :address_city,
              :address_state, :address_zip_code, :phone_number, :salary, :discount_inss, :created_at, :updated_at
json.url employee_url(employee, format: :json)
