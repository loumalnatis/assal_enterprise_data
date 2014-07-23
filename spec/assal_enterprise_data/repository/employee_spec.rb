require 'spec_helper'
require 'assal_enterprise_data/repository/employee'

describe AssalEnterpriseData::Repository::Employee do
  let(:record1) { {
    emp_date:       Date.civil(2014, 1, 1),
    emp_first_name: "First",
    emp_last_name:  "Last",
    emp_mi:          nil,
    emp_id:          "123",
    emp_rate1:       1.00,
    emp_rate2:       2.00,
    emp_rate3:       3.00,
    emp_rate4:       4.00,
    emp_rate5:       5.00
  } }

  let(:dataset) { TestDBConnection.dataset.from(:emp) }
  subject { described_class.new(TestDBConnection) }

  context '#find_by_employee_id' do
    it 'finds by employee id' do
      dataset << record1
      employee = subject.find_by_employee_id('123')
      employee.emp_first_name == 'First'
      employee.emp_rate1 == 1.00
      employee.emp_rate2 == 2.00
      employee.emp_rate3 == 3.00
      employee.emp_rate4 == 4.00
      employee.emp_rate5 == 5.00
    end
  end

  context '#find_all' do
    it 'finds all employees' do
      dataset << record1
      employees = subject.find_all

      employees.should be_a(Array)
      employees.count.should == 1
      employees.first.emp_first_name == 'First'
    end
  end

  context '#create!' do
    it 'creates a new employee record' do
      params = {
        emp_date: Date.civil(2014, 1, 1),
        emp_first_name: "First",
        emp_last_name: "Last",
        emp_mi: nil,
        emp_id: "123",
        emp_rate1: 10.00
      }

      created_emp = subject.create!(params)
      found_emp = subject.find_by_employee_id(created_emp.emp_id)

      found_emp.should_not be_nil
    end
  end
end
