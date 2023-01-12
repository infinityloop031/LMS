class CreateSections < ActiveRecord::Migration[7.0]
  def change
    create_table :sections do |t|
      t.references :semester, null: false, foreign_key: true
      t.references :teacher, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
