# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Admin Creation
admin=Admin.create(email:"admin@gmail.com",password:"123123")


# Semester Data [1-8] Fall,Spring
Semester.create(semester_number:1,semester_type:"Fall")
Semester.create(semester_number:2,semester_type:"Fall")
Semester.create(semester_number:3,semester_type:"Fall")
Semester.create(semester_number:4,semester_type:"Fall")
Semester.create(semester_number:5,semester_type:"Fall")
Semester.create(semester_number:6,semester_type:"Fall")
Semester.create(semester_number:7,semester_type:"Fall")
Semester.create(semester_number:8,semester_type:"Fall")
Semester.create(semester_number:1,semester_type:"Spring")
Semester.create(semester_number:2,semester_type:"Spring")
Semester.create(semester_number:3,semester_type:"Spring")
Semester.create(semester_number:4,semester_type:"Spring")
Semester.create(semester_number:5,semester_type:"Spring")
Semester.create(semester_number:6,semester_type:"Spring")
Semester.create(semester_number:7,semester_type:"Spring")
Semester.create(semester_number:8,semester_type:"Spring")

# Batches 1-4
Batch.create(batch_number:1)
Batch.create(batch_number:2)
Batch.create(batch_number:3)
Batch.create(batch_number:4)


# Grades

Grade.create(letter:"A+")
Grade.create(letter:"A")
Grade.create(letter:"A-")
Grade.create(letter:"B+")
Grade.create(letter:"B")
Grade.create(letter:"B-")
Grade.create(letter:"C+")
Grade.create(letter:"C")
Grade.create(letter:"C-")
Grade.create(letter:"F")
Grade.create(letter:"Pending")
