json.extract! employee, :id, :name, :born_date, :address, :address_number, :address_neigborhood, :address_city,
              :address_state, :address_zip_code, :phone_number, :salary, :created_at, :updated_at
json.url employee_url(employee, format: :json)
