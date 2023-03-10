## Learning Management System API

- Start project
```ruby
rails new lms --api -d mysql
```

- Create instructors
```ruby
rails g model Instructor name email password active:boolean status
```

- Create students
```ruby
rails g scaffold Student name email password

rails g model Student name email password
```

- Create teaching_levels
```ruby
rails g model TeachingLevel codigo description
```

- Create semesters
```ruby
rails g model Semester current_semester current_semester_code description
```

- Create courses

```ruby
rails g scaffold Course instructor:references student:references semester:references teaching_level:references name description

rails g model Course instructor:references student:references semester:references teaching_level:references name description

```

- Create tasks
```ruby
rails g model Task course:references description task_note limit_note:integer

```

### Be sure customize your migrations before create and migrate data

- Create database and migration data

```ruby
rails db:create && \
rails db:migrate && \
rails db:seed
```

### API ROUTES

```ruby
GET http://localhost:3000/api/v1/students

POST http://localhost:3000/api/v1/students

{
    "name": "Julia Torvalds",
    "email": "juliatorvalds@hulu.com",
    "password_digest": "123123"
}

{
    "name": "John Mayer",
    "email": "mayer@hulu.com",
    "password_digest": "123123"
}

POST http://localhost:3000/api/v1/login

{
    "email": "juliatorvalds@hulu.com",
    "password_digest": "123123"
}

{
    "email": "mayer@hulu.com",
    "password_digest": "123123"
}

GET http://localhost:3000/api/v1/tasks

GET http://localhost:3000/api/v1/instructors

POST http://localhost:3000/api/v1/instructors

{
    "name": "Sr. Smith Sanchez",
    "email": "smithsanchez@hulu.com",
    "password_digest": "123123"
}

{
    "name": "Sra. McDonald",
    "email": "mcdonald@hulu.com",
    "password_digest": "123123"
}

POST http://localhost:3000/api/v1/instructor_login

{
    "email": "smithsanchez@hulu.com",
    "password_digest": "123123"
}

{
    "email": "mcdonald@hulu.com",
    "password_digest": "123123"
}

GET http://localhost:3000/api/v1/check_tasks

GET http://localhost:3000/api/v1/courses

```

- Route to generate report tasks

```ruby
GET http://localhost:3000/api/v1/generate_tasks_report

```