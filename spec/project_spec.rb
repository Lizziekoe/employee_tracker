require('spec_buddy')

describe(Project) do
  it('will tells which employee is working on a given project') do
    employee = Employee.create({:name => "Rosa"})
    project1 = Project.create({:description => "bus boycott", :employee_id => employee.id})
    expect(project1.employee()).to(eq(employee))
  end
end
