# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/employees', type: :request do # rubocop:disable Metrics/BlockLength
  let!(:valid_attributes) do
    {
      name: Faker::Name.name,
      salary: rand(1000...10_000)
    }
  end

  let!(:invalid_attributes) do
    {
      name: nil,
      salary: rand(1000...10_000)
    }
  end

  def set_host (host)
    host! host
    Capybara.app_host = "http://#{host}"
  end

  before(:each) do
    set_host 'localhost:3000'

    user = FactoryBot.create(:user)
    sign_in user
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Employee.create! valid_attributes
      get employees_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      employee = Employee.create! valid_attributes
      get employee_url(employee)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_employee_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      employee = Employee.create! valid_attributes
      get edit_employee_url(employee)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Employee' do
        expect do
          post employees_url, params: { employee: valid_attributes }
        end.to change(Employee, :count).by(1)
      end

      it 'redirects to the created employee' do
        post employees_url, params: { employee: valid_attributes }
        expect(response).to redirect_to(employees_url)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Employee' do
        expect do
          post employees_url, params: { employee: invalid_attributes }
        end.to change(Employee, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post employees_url, params: { employee: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          name: Faker::Name.name,
          salary: rand(1_000...10_000)
        }
      end

      it 'updates the requested employee' do
        employee = Employee.create! valid_attributes
        patch employee_url(employee), params: { employee: new_attributes }
        employee.reload
        expect(employee.name).to eq(new_attributes[:name])
        expect(employee.salary).to eq(new_attributes[:salary])
      end

      it 'redirects to the employee' do
        employee = Employee.create! valid_attributes
        patch employee_url(employee), params: { employee: new_attributes }
        employee.reload
        expect(response).to redirect_to(employees_url)
      end
    end

    context 'with invalid parameters' do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        employee = Employee.create! valid_attributes
        patch employee_url(employee), params: { employee: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested employee' do
      employee = Employee.create! valid_attributes
      expect do
        delete employee_url(employee)
      end.to change(Employee, :count).by(-1)
    end

    it 'redirects to the employees list' do
      employee = Employee.create! valid_attributes
      delete employee_url(employee)
      expect(response).to redirect_to(employees_url)
    end
  end
end
