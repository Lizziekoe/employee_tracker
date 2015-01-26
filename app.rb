require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("sinatra/activerecord")
require("pg")
require("./lib/employee")
require("./lib/division")


get('/') do
  @employees = Employee.all()
  @divisions = Division.all()
  erb(:index)
end

post('/divisions') do
  department = params.fetch('department')
  @division = Division.create({:department => department})
  @divisions = Division.all()
  redirect('/')
end

get('/divisions/:id') do
  @division = Division.find(params.fetch("id").to_i())
  @employees = Employee.all()
  erb(:employees)
end

post('/employees') do
  name = params.fetch('name')
  division_id = params.fetch('division_id').to_i()
  @employee = Employee.create({:name => name, :division_id => division_id})
  @division = Division.find(division_id)
  erb(:employees)
end

get('/employees/:id/edit') do
  @employee = Employee.find(params.fetch("id").to_i())
  erb(:employee_edit)
end

patch("/employees/:id") do
  # @division = Division.find(params.fetch("id").to_i())
  name = params.fetch("name")
  @employee = Employee.find(params.fetch("id").to_i())
  @employee.update({:name => name})
  @employees = Employee.all()
  redirect('/')
end
