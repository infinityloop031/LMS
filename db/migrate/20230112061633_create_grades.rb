class CreateGrades < ActiveRecord::Migration[7.0]
  def change
    create_table :grades do |t|
      t.string :letter

      t.timestamps
    end
  end
end
