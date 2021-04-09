class AddCreatorToExcels < ActiveRecord::Migration[6.1]
  def change
    add_column :excels, :creator, :string
  end
end
