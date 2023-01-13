class Department
  attr_reader :name,
              :employees,
              :expenses

  def initialize(name)
    @name = name
    @employees = []
    @expenses = 0
  end

  def hire(employee)
    @employees << employee
  end

  def expense(amount)
    @expenses += amount
  end

  def employee_expense(employee, amount)
    employee_expense_hash = Hash.new(0)
    employee_expense_hash[employee] += expense(amount)
    employee_expense_hash
  end

  
end