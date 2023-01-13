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

end