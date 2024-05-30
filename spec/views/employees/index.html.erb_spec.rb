# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'employees/index', type: :view do
  before(:each) do
    assign(:employees, Kaminari.paginate_array([FactoryBot.create(:employee), FactoryBot.create(:employee)]).page(1))
  end

  it 'renders a list of employees' do
    render
    cell_selector = 'tr>th'
    assert_select cell_selector, text: Regexp.new('ID'.to_s), count: 1
    assert_select cell_selector, text: Regexp.new('Nome'.to_s), count: 1
    assert_select cell_selector, text: Regexp.new('CPF'.to_s), count: 1
    assert_select cell_selector, text: Regexp.new('Data de Nascimento'.to_s), count: 1
    assert_select cell_selector, text: Regexp.new('Salário'.to_s), count: 1
    assert_select cell_selector, text: Regexp.new('Desconto INSS'.to_s), count: 1
  end
end
