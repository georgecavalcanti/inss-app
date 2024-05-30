# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Employee, type: :model do
  it 'is valid with valid attributes' do
    employee = FactoryBot.create(:employee)
    expect(employee).to be_valid
  end

  it 'is not valid without a name' do
    employee = FactoryBot.build(:employee, name: nil)
    expect(employee).to_not be_valid
  end

  it 'is not valid without a salary' do
    employee = FactoryBot.build(:employee, salary: nil)
    expect(employee).to_not be_valid
  end
end
