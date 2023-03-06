class GenerateTasksReportJob < ApplicationJob
  queue_as :default

  def perform
    workbook = RubyXL::Workbook.new

    tab = workbook.worksheets[0]
    tab.sheet_name = 'Course Tasks'

    tasks = Course.select(%(
                tasks.description AS task_description,
                tasks.task_note,
                tasks.limit_note,
                students.name AS student_name,
                CONCAT(teaching_levels.description , " - ", courses.name) AS course_name,
                courses.description AS course_description,
                CONCAT(semesters.description, " - ", semesters.current_semester) AS current_semester,
                instructors.name AS instructor_name
              )).joins(:instructor, :student, :semester, :teaching_level).left_joins(:tasks)

    # Monta o cabeçalho da planilha
    header = ['Task Ddescription', 'Task Note', 'Limit Note', 'Student Name', 'Course Name', 'Course Description', 'Current Semester', 'Instructor Name']
    header.each.with_index(0) { |data, row| tab.add_cell(0, row, data) }

    # Monta os dados daplanilha
    tasks.each.with_index(1) do |data, col|
      tab.add_cell(col, 0, data[:task_description])
      tab.add_cell(col, 1, data[:task_note])
      tab.add_cell(col, 2, data[:limit_note])
      tab.add_cell(col, 3, data[:student_name])
      tab.add_cell(col, 4, data[:course_name])
      tab.add_cell(col, 5, data[:course_description])
      tab.add_cell(col, 6, data[:current_semester])
      tab.add_cell(col, 7, data[:instructor_name])
    end

    workbook.stream.read
  end
end
