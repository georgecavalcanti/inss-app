# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'employees/show', type: :view do
  before(:each) do
    assign(:employee, Employee.create!(
                        name: 'Name',
                        address: 'Address',
                        address_number: 'Address Number',
                        address_neigborhood: 'Address Neigborhood',
                        address_city: 'Address City',
                        address_state: 'Address State',
                        address_zip_code: 'Address Zip Code',
                        phone_number: 'Phone Number',
                        salary: '9.99'
                      ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/Address Number/)
    expect(rendered).to match(/Address Neigborhood/)
    expect(rendered).to match(/Address City/)
    expect(rendered).to match(/Address State/)
    expect(rendered).to match(/Address Zip Code/)
    expect(rendered).to match(/Phone Number/)
    expect(rendered).to match(/9.99/)
  end
end
