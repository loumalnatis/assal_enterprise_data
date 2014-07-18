require 'spec_helper'
require 'assal_enterprise_data/context/find_employee_name'
require 'ostruct'

describe AssalEnterpriseData::Context::FindEmployeeName do
  let(:record1) { OpenStruct.new(
    emp_date:       Date.civil(2014, 1, 1),
    emp_first_name: "First",
    emp_last_name:  "Last",
    emp_mi:          nil,
    emp_id:          "123"
  ) }

  let(:employee_repo) { double(:employee_repo) }

  subject { described_class.new(employee_repo) }

  context '#call' do
    it 'finds by employee id' do
      employee_repo.should_receive(:find_by_employee_id).with('123').and_return(record1)
      employee = subject.call('123')
      employee.emp_first_name == 'First'
    end

    it 'returns nil if employee id is not found' do
      employee_repo.should_receive(:find_by_employee_id).with('123').and_return(nil)
      employee = subject.call('123')
      employee.should be_nil
    end
  end
end
