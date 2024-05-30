# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'employees/edit', type: :view do
  let(:employee) { FactoryBot.create(:employee) }

  before(:each) do
    assign(:employee, employee)
  end

  it 'renders the edit employee form' do
    render

    assert_select 'form[action=?][method=?]', employee_path(employee), 'post' do
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
