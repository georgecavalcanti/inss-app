# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'employees/index', type: :view do
  before(:each) do
    assign(:employees, [
             Employee.create!(
               name: 'Name',
               address: 'Address',
               address_number: 'Address Number',
               address_neigborhood: 'Address Neigborhood',
               address_city: 'Address City',
               address_state: 'Address State',
               address_zip_code: 'Address Zip Code',
               phone_number: 'Phone Number',
               salary: '9.99'
             ),
             Employee.create!(
               name: 'Name',
               address: 'Address',
               address_number: 'Address Number',
               address_neigborhood: 'Address Neigborhood',
               address_city: 'Address City',
               address_state: 'Address State',
               address_zip_code: 'Address Zip Code',
               phone_number: 'Phone Number',
               salary: '9.99'
             )
           ])
  end

  it 'renders a list of employees' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Name'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Address'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Address Number'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Address Neigborhood'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Address City'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Address State'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Address Zip Code'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Phone Number'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('9.99'.to_s), count: 2
  end
end
