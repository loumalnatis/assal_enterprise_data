require 'spec_helper'
require 'assal_enterprise_data/context/employee/create'

describe AssalEnterpriseData::Context::Employee::Create do
  let(:params) { {
    emp_date: Date.civil(2014, 1, 1),
    emp_first_name: "First",
    emp_last_name: "Last",
    emp_id: "123",
    emp_rate1: 10.00
  } }

  let(:employee_repo) { double(:employee_repo) }

  context '#call' do
    subject { described_class.new(employee_repo) }

    it 'creates a new employee' do
      employee_repo.should_receive(:create!).with(params).and_return(params)

      created_emp = subject.call(params)
      created_emp.should_not be_nil
    end
  end

end
