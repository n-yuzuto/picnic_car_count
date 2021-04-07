class CreateExcels < ActiveRecord::Migration[6.1]
  def change
    create_table :excels do |t|
      t.date :day
      t.string :place
      t.text :content

      t.timestamps
    end
  end
end
