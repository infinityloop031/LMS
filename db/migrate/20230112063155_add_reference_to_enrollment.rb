class AddReferenceToEnrollment < ActiveRecord::Migration[7.0]
  def change
    add_reference :enrollments, :grade, null: true, foreign_key: false, default: 11
    Enrollment.where(grade_id: nil).update_all(grade_id: 11)
  end
end
