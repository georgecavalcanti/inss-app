# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'employees/new', type: :view do
  before(:each) do
    assign(:employee, Employee.new(
                        name: 'MyString',
                        address: 'MyString',
                        address_number: 'MyString',
                        address_neighborhood: 'MyString',
                        address_city: 'MyString',
                        address_state: 'MyString',
                        address_zip_code: 'MyString',
                        phone_number: 'MyString',
                        salary: '9.99'
                      ))
  end

  it 'renders new employee form' do
    render

    assert_select 'form[action=?][method=?]', employees_path, 'post' do
      assert_select 'input[name=?]', 'employee[name]'

      assert_select 'input[name=?]', 'employee[address]'

      assert_select 'input[name=?]', 'employee[address_number]'

      assert_select 'input[name=?]', 'employee[address_neighborhood]'

      assert_select 'input[name=?]', 'employee[address_city]'

      assert_select 'input[name=?]', 'employee[address_state]'

      assert_select 'input[name=?]', 'employee[address_zip_code]'

      assert_select 'input[name=?]', 'employee[phone_number]'

      assert_select 'input[name=?]', 'employee[salary]'
    end
  end
end
