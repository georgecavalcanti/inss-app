# frozen_string_literal: true

class CreateEmployees < ActiveRecord::Migration[7.1]
  def change
    create_table :employees do |t|
      t.string :name
      t.date :born_date
      t.string :address
      t.string :address_number
      t.string :address_neigborhood
      t.string :address_city
      t.string :address_state
      t.string :address_zip_code
      t.string :phone_number
      t.decimal :salary

      t.timestamps
    end
  end
end
