class Budget
  attr_reader :name,
              :year,
              :departments

  def initialize(name, year)
    @name = name
    @year = year
    @departments = []
  end
end