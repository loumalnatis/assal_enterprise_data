require 'spec_helper'
require 'assal_enterprise_data'

describe AssalEnterpriseData do
  let(:employee_repo) { double(:employee_repo, find_by_employee_id: nil) }
  let(:find_employee_context) { double(:find_employee_context) }

  before do
    AssalEnterpriseData.should_receive(:employee_repo).and_return(employee_repo)
  end

  it 'calls find_employee context' do
    AssalEnterpriseData::Context::FindEmployee.should_receive(:new).with(employee_repo).and_return(find_employee_context)
    find_employee_context.should_receive(:call)
    employee = AssalEnterpriseData.find_employee('123')
  end
end
