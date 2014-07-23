require 'spec_helper'
require 'assal_enterprise_data/context/employee/all'
require 'ostruct'

describe AssalEnterpriseData::Context::Employee::All do
  let(:record1) { OpenStruct.new(
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
  ) }

  let(:employee_repo) { double(:employee_repo) }

  subject { described_class.new(employee_repo) }

  context '#call' do
    it 'finds by employee id' do
      employee_repo.should_receive(:find_all).and_return([record1])
      employees = subject.call

      employees.should be_a(Array)
      employees.count.should == 1

      employee = employees.first
      employee.emp_id == '123'
      employee.emp_first_name == 'First'
      employee.emp_last_name == 'Last'
      employee.emp_rate1 == 1.00
      employee.emp_rate2 == 2.00
      employee.emp_rate3 == 3.00
      employee.emp_rate4 == 4.00
      employee.emp_rate5 == 5.00
    end

    it 'returns an empty array if there are no employees' do
      employee_repo.should_receive(:find_all).and_return([])
      employees = subject.call
      employees.should be_empty
    end
  end
end
