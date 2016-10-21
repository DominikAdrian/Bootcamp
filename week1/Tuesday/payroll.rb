class Employee
  attr_accessor :name, :email
  def initialize (name, email)
    @name
    @email
  end
end

class HourlyEmployee < Employee
  def initialize (name, email, hourly_rate, hours_worked)
    @name = name
    @email = email
    @hourly_rate = hourly_rate
    @hours_worked = hours_worked
  end

  def calculate_salary
    @hours_worked*@hourly_rate
  end
end

class SalariedEmployee < Employee
  def initialize (name, email, salary)
    @name = name
    @email = email
    @salary = salary
  end

  def calculate_salary
    @salary/52
  end
end

class MultiPaymentEmployee < Employee
  def initialize (name, email, salary, hourly_rate, hours_worked)
    @name = name
    @email = email
    @salary = salary
    @hourly_rate = hourly_rate
    @hours_worked = hours_worked
  end

   def calculate_salary
     if @hours_worked > 40
       @salary/52 + (@hours_worked-40)*@hourly_rate
     else
       @salary/52
    end
  end
end

class Payroll
    def initialize(employees)
        @employees = employees
    end

    def notify_employee(employee)
            puts "Hello #{employee.name}, your weekly wage is $#{employee.calculate_salary}. Spend it wisely!"
    end

    def pay_employees
      payment = @employees.reduce(0.0) do |sum,employee|
        notify_employee(employee)
        (sum + employee.calculate_salary)
      end
      payment = payment * 1.18
      puts "The total amount payed is $#{payment}"
    end
end


josh = HourlyEmployee.new('Josh', 'nachoemail@example.com', 35, 50)
nizar = SalariedEmployee.new('Nizar', 'starcraftrulez@gmail.com', 1000000)
ted = MultiPaymentEmployee.new('Ted', 'fortranr0x@gmail.com', 60000, 275, 55)
domi = HourlyEmployee.new('Domi', 'dominik.example@gmail.com', 15, 50)
david = HourlyEmployee.new('Marc', 'david.example@gmail.com', 15, 50)

employees = [josh, nizar, ted, domi, david]
payroll = Payroll.new(employees)
puts payroll.pay_employees
