class Budget
  attr_reader :name,
              :year,
              :departments

  def initialize(name, year)
    @name = name
    @year = year
    @departments = []
  end

  def add_department(department)
    @departments << department
  end

  def frugal_departments
    @departments.select do |department|
      department.expenses < 500
    end
  end

  def all_employees_salaries
    employees_salary_hash = Hash.new(0)
    @departments.each do |department|
      department.employees.each do |employee|
        employees_salary_hash[employee] = employee.salary
      end
    end
    employees_salary_hash
  end
end