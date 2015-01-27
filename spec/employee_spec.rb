require('spec_buddy')
describe(Employee) do
  it('tells what division an employee belongs to') do
    this_division = Division.create({:department => "soulless accounting"})
    employee1 = Employee.create({:name => "Lee", :division_id => this_division.id})
    expect(employee1.division()).to(eq(this_division))
  end

  it("tells what projects an employee is working on") do
    employee = Employee.create({:name => "Rosa"})
    project1 = Project.create({:description => "party all the time", :employee_id => employee.id})
    project2 = Project.create({:description => "sleep all the time", :employee_id => employee.id})
    expect(employee.projects()).to(eq([project1, project2]))
  end
end
