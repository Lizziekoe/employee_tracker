require('spec_buddy')
describe(Employee) do
  it('tells what division an employee belongs to') do
    this_division = Division.create({:department => "soulless accounting"})
    employee1 = Employee.create({:name => "Lee", :division_id => this_division.id})
    expect(employee1.division()).to(eq(this_division))
  end
end
