# frozen_string_literal: true

class EmployeesController < ApplicationController
  before_action :set_employee, only: %i[show edit update destroy]

  def chart
    @employees_count = [
      Employee.where('salary <= 1412').count,
      Employee.where('salary > 1412 AND salary <= 2668.68').count,
      Employee.where('salary > 2668.68 AND salary <= 4000.03').count,
      Employee.where('salary > 4000.03 AND salary <= 7786.02').count,
      Employee.where('salary > 7786.02').count
    ]

    render json: @employees_count, status: :ok
  end

  # GET /employees or /employees.json
  def index
    @employees = Employee.order(created_at: :desc).page(params[:page])

    respond_to do |format|
      format.html
      format.csv { send_data Employee.all.to_csv, filename: "employees-#{Time.now}.csv" } 
    end
  end

  # GET /employees/1 or /employees/1.json
  def show; end

  # GET /employees/new
  def new
    @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit; end

  # POST /employees or /employees.json
  def create
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to employees_url, notice: 'Funcionário criado com sucesso.' }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1 or /employees/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to employees_url, notice: 'Funcionário Atualizado.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1 or /employees/1.json
  def destroy
    @employee.destroy!

    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'Funcionário removido com sucesso.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_employee
    @employee = Employee.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def employee_params
    params.require(:employee).permit(
      :name, :birthdate, :address, :address_number, :address_neighborhood,
      :address_city, :address_state, :address_zip_code, :phone_number, :salary, :discount_inss,
      :document
    )
  end
end
