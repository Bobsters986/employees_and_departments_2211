require './lib/employee'
require './lib/department'
require './lib/budget'

RSpec.describe Budget do
  let(:customer_service) { Department.new("Customer Service") }
  let(:h_r) { Department.new("Human Resources") }
  let(:security) { Department.new("Security") }
  let(:bobbi) { Employee.new({name: "Bobbi Jaeger", age: "30", salary: "$100000"}) }
  let(:aaron) { Employee.new({name: "Aaron Tanaka", age: "25", salary: "$90000"}) }
  let(:jill) { Employee.new({name: "Jill Stahley", age: "33", salary: "$95000"}) }
  let(:john) { Employee.new({name: "John McClane", age: "40", salary: "$85000"}) }
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
      security.hire(john)
    end

    it 'can #add_department' do
      budget.add_department(customer_service)
      budget.add_department(h_r)
      budget.add_department(security)

      expect(budget.departments).to eq([customer_service, h_r, security])
    end
  end

  describe 'list #frugal_departments and #all_employees_salaries' do
    before do
      customer_service.hire(bobbi)
      customer_service.hire(aaron)
      h_r.hire(jill)
      security.hire(john)

      budget.add_department(customer_service)
      budget.add_department(h_r)
      budget.add_department(security)

      customer_service.expense(100)
      customer_service.expense(375)
      h_r.expense(700)
      security.expense(300)
    end

    it '#frugal_departments' do
      expect(budget.frugal_departments).to eq([customer_service, security])
    end

    it '#all_employees_salaries' do
      expected_hash = {
        bobbi => 100000,
        aaron => 90000,
        jill => 95000,
        john => 85000
      }

      expect(budget.all_employees_salaries).to eq(expected_hash)
    end

  end


end