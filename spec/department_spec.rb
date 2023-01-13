require './lib/employee'
require './lib/department'

RSpec.describe Department do
  let(:customer_service) { Department.new("Customer Service") }
  let(:bobbi) { Employee.new({name: "Bobbi Jaeger", age: "30", salary: "$100000"}) }
  let(:aaron) { Employee.new({name: "Aaron Tanaka", age: "25", salary: "$90000"}) }

   describe '#initialize' do
    it 'exists' do
      expect(customer_service).to be_a(Department)
    end

    it 'has attributes' do
      expect(customer_service.name).to eq("Customer Service")
      expect(customer_service.employees).to eq([])
    end
  end

  describe '#hire_employees and calculate expenses' do
    it 'can #hire_employees' do
      customer_service.hire(bobbi)
      customer_service.hire(aaron)

      expect(customer_service.employees).to eq([bobbi, aaron])
    end

    it 'starts with no #expenses can add #expense' do
      expect(customer_service.expenses).to eq(0)

      customer_service.expense(100)
      customer_service.expense(25)

      expect(customer_service.expenses).to eq(125)
    end

    it 'can track #employee_expense, #employee_expense_total, and overall #expenses' do
      customer_service.employee_expense(bobbi, 100)
      customer_service.employee_expense(aaron, 25)

      expected_hash = { bobbi => 100, aaron => 25 }
      
      expect(customer_service.employee_expense_total).to eq(expected_hash)
      expect(customer_service.expenses).to eq(125)

      customer_service.employee_expense(bobbi, 50)
      customer_service.employee_expense(aaron, 75)

      expected_hash_2 = { bobbi => 150, aaron => 100 }
      expect(customer_service.employee_expense_total).to eq(expected_hash_2)
      expect(customer_service.expenses).to eq(250)
    end
  end
end