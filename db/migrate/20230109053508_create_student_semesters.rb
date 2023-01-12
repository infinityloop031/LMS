class CreateStudentSemesters < ActiveRecord::Migration[7.0]
  def change
    create_table :student_semesters do |t|
      t.references :student, null: false, foreign_key: true
      t.references :semester, null: false, foreign_key: true
      t.integer :year

      t.timestamps
    end
  end
end
