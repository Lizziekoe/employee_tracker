require('spec_buddy')

describe(Division) do
  it("tells which employees are in that division") do
    division = Division.create({:department => "corporate"})
    employee1 = Employee.create({:name => "Ben", :division_id => division.id})
    employee2 = Employee.create({:name => "Sal", :division_id => division.id})
    expect(division.employees()).to(eq([employee1, employee2]))
  end
end
