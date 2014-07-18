require 'spec_helper'
require 'assal_enterprise_data/context/find_employee'
require 'ostruct'

describe AssalEnterpriseData::Context::FindEmployee do
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
      employee_repo.should_receive(:find_by_employee_id).with('123').and_return(record1)
      employee = subject.call('123')
      employee.emp_id == '123'
      employee.emp_first_name == 'First'
      employee.emp_last_name == 'Last'
      employee.emp_rate1 == 1.00
      employee.emp_rate2 == 2.00
      employee.emp_rate3 == 3.00
      employee.emp_rate4 == 4.00
      employee.emp_rate5 == 5.00
    end

    it 'returns nil if employee id is not found' do
      employee_repo.should_receive(:find_by_employee_id).with('123').and_return(nil)
      employee = subject.call('123')
      employee.should be_nil
    end
  end
end
