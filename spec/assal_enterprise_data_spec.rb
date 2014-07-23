require 'spec_helper'
require 'assal_enterprise_data'

describe AssalEnterpriseData do
  let(:employee_repo) { double(:employee_repo, find_by_employee_id: nil) }
  let(:find_by_employee_id_context) { double(:find_by_employee_id_context) }
  let(:create_employee_context) { double(:create_employee_context) }
  let(:find_all_employees_context) { double(:find_all_employees_context) }

  before do
    AssalEnterpriseData.should_receive(:employee_repo).and_return(employee_repo)
  end

  it 'calls find_by_employee_id context' do
    AssalEnterpriseData::Context::Employee::FindByEmployeeId.should_receive(:new).with(employee_repo).and_return(find_by_employee_id_context)
    find_by_employee_id_context.should_receive(:call)
    employee = AssalEnterpriseData.find_by_employee_id('123')
  end

  it 'calls create_employee context' do
    AssalEnterpriseData::Context::Employee::Create.should_receive(:new).with(employee_repo).and_return(create_employee_context)
    create_employee_context.should_receive(:call)
    employee = AssalEnterpriseData.employee_create({:emp_id => "123"})
  end

  it 'calls find_all_employees context' do
    AssalEnterpriseData::Context::Employee::All.should_receive(:new).with(employee_repo).and_return(find_all_employees_context)
    find_all_employees_context.should_receive(:call)
    employee = AssalEnterpriseData.find_all_employees
  end
end
