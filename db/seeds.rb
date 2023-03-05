# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Instructor.find_or_create_by(name: 'Sr. Smith Sanchez', email: 'smithsanchez@hulu.com', password: 'kJtY#$*m123')
Instructor.find_or_create_by(name: 'Sra. McDonald', email: 'mcdonald@hulu.com', password: 'kJtY#$*m123')

Student.find_or_create_by(name: 'Julia Torvalds', email: 'juliatorvalds@hulu.com', password: 'kJtY#$*m123')
Student.find_or_create_by(name: 'John Mayer', email: 'mayer@hulu.com', password: 'kJtY#$*m123')

TeachingLevel.find_or_create_by(codigo: 'Lvl1', description: 'Nível 1')
TeachingLevel.find_or_create_by(codigo: 'Lvl2', description: 'Nível 2')

Semester.find_or_create_by(current_semester: '2023/01', current_semester_code: 'S1', description: 'Primavera')
Semester.find_or_create_by(current_semester: '2023/02', current_semester_code: 'S2', description: 'Verão')

Course.create(
  instructor_id: 1,
  student_id: 2,
  semester_id: 1,
  teaching_level_id: 1,
  name: 'Inglês Básico',
  description: 'Gramática de uso da língua inglesa'
)

Course.create(
  instructor_id: 2,
  student_id: 2,
  semester_id: 2,
  teaching_level_id: 2,
  name: 'Inglês Intermediário',
  description: 'Conversação da língua inglesa'
)

Course.create(
  instructor_id: 2,
  student_id: 1,
  semester_id: 2,
  teaching_level_id: 2,
  name: 'Inglês Intermediário',
  description: 'Conversação da língua inglesa'
)

Task.create!( course_id: 1, description: 'Tarefa 1 (Teste Gramatical)', task_note: '95')

Task.create!( course_id: 1, description: 'Tarefa 2 (Teste conversação)', task_note: '')
