class Employee
  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  atr_reader :name, :title, :salary, :boss

  def bonus(int)
    @salary * int
  end
end

class Manager < Employee
  def initialize(assigned_employees, name, title, salary, boss)
    @assigned_employees = assigned_employees
    super(name, title, salary, boss)
  end

  def bonus(int)
    int * assigned_employees.reduce(0) { |total, employee| total + employee.salary } 
  end
end
