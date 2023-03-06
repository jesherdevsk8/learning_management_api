## Learning Management System API

- Start project
> rails new lms --api -d mysql

- Create instructors
> rails g model Instructor name email password active:boolean status

- Create students
> rails g scaffold Student name email password

> rails g model Student name email password

- Create teaching_levels

> rails g model TeachingLevel codigo description

- Create semesters

> rails g model Semester current_semester current_semester_code description

- Create courses
> rails g scaffold Course instructor:references student:references semester:references teaching_level:references name description

> rails g model Course instructor:references student:references semester:references teaching_level:references name description

- Create tasks

> rails g model Task course:references description task_note limit_note:integer

### Be sure customize your migrations before create and migrate data

- Create database and migration data

```bash
rails db:create && \
rails db:migrate && \
rails db:seed
```