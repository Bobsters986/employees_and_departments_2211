require './lib/employee'
require './lib/department'
require './lib/budget'

RSpec.describe Budget do
  let(:customer_service) { Department.new("Customer Service") }
  let(:h_r) { Department.new("Human Resources") }
  let(:bobbi) { Employee.new({name: "Bobbi Jaeger", age: "30", salary: "$100000"}) }
  let(:aaron) { Employee.new({name: "Aaron Tanaka", age: "25", salary: "$90000"}) }
  let(:jill) { Employee.new({name: "Jill Stahley", age: "33", salary: "$95000"}) }
  let(:budget) { Budget.new("State of Colorado", 2022) }

   describe '#initialize' do
    it 'exists' do
      expect(budget).to be_a(Budget)
    end

    it 'has attributes' do
      expect(budget.name).to eq("State of Colorado")
      expect(budget.year).to eq(2022)
      expect(budget.departments).to eq([])
    end
  end

  describe 'budget can add departments' do
    before do
      customer_service.hire(bobbi)
      customer_service.hire(aaron)
      h_r.hire(jill)
    end

    it 'can #add_department' do
      budget.add_department(customer_service)
      budget.add_department(h_r)

      expect(budget.departments).to eq([customer_service, h_r])
    end
  end

  
end