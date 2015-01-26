class CreateDivisions < ActiveRecord::Migration
  def change
    create_table(:divisions) do |d|
      d.column(:department, :string)

      d.timestamps
    end
  end
end
