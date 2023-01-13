class Department
  attr_reader :name,
              :employees,
              :expenses,
              :employee_expense_total

  def initialize(name)
    @name = name
    @employees = []
    @expenses = 0
    @employee_expense_total = Hash.new(0)
  end

  def hire(employee)
    @employees << employee
  end

  def expense(amount)
    @expenses += amount
  end

  def employee_expense(employee, amount)
    expense(amount)
    employee_expense_total[employee] += amount
  end
end