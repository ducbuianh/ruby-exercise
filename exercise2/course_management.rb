require './course'
require './student'

class Program
  @@students = nil
  @@courses = nil

  def initialize
    @@students = []
    @@courses = []
  end

  def run
    while 1 do
      print_menu
      option = gets.chomp.to_i

      case option
      when 1
        add_student
      when 2
        add_course
      when 3
        record_grade
      when 4
        look_up_student_grade
      when 5
        exit
      else
        puts "Plase input only 1 to 5"
      end

    end 
  end

  def add_student
    puts "\nPlease enter student ID:"
    student_id = validate_create_new_student_id

    puts "Please enter student name:"
    student_name = gets.chomp

    puts "Please enter student age:"
    student_age = validate_student_age

    puts "Please enter student gender (M/Male/F/Female/Other):"
    student_gender = gets.chomp.downcase

    # Add newly created student to list
    student = Student.new(student_id, student_name, student_age, student_gender)
    @@students << student
  end

  def add_course
    puts "\nPlease enter course name:"
    course_name = validate_course_name

    # Add newly created course to list
    course = Course.new(course_name)
    @@courses << course
  end

  def record_grade
    puts "\nPlease select a course:"
    @@courses.each_with_index {|c, index| puts "#{index+1}): #{c.name} " }
    index = validate_course_index

    puts "Please enter student ID:"
    student_id = validate_existed_student_id

    puts "Please enter student grade:"
    student_grade = validate_student_grade

    # Add student grade info to selected course
    @@courses[index].student_info[student_id.to_i] = student_grade
  end

  def look_up_student_grade
    puts "\nPlease enter student ID:"
    student_id = validate_existed_student_id

    puts "Please select a course:"
    @@courses.each_with_index {|c, index| puts "#{index+1}): #{c.name} " }
    index = validate_course_index
    course_name = @@courses[index].name

    student_name = @@students.select{|s| s.id == student_id}[0].name
    student_info = @@courses.select{|c| c.name == course_name}[0].student_info
    student_grade = student_info[student_id.to_i]

    # Print out student's grade
    if student_grade != nil then
      puts "#{student_name}\'s grade in #{course_name} is #{student_grade}"
    else
      puts "#{student_name} hasnt got #{course_name} grade yet."
    end
  end

  def validate_create_new_student_id
    passed = false;
    begin
      id = gets.chomp
      # Check integer
      if !is_i(id) then
        puts "ID must be integer! Please enter student ID again:"
        next
      end
      # Check_exist
      if @@students.any? {|s| s.id == id} then
        puts "This ID is existed! Please enter student ID again:"
        next
      end
      passed = true;
    end while not passed
    return id
  end

  def validate_existed_student_id
    passed = false;
    begin
      id = gets.chomp
      # Check integer
      if !is_i(id) then
        puts "ID must be integer! Please enter student ID again:"
        next
      end
      # Check_exist
      if !@@students.any? {|s| s.id == id} then
        puts "This ID does not exist! Please enter student ID again:"
        next
      end
      passed = true;
    end while not passed
    return id
  end

  def validate_student_age
    passed = false;
    begin
      age = gets.chomp
      # Check integer
      if !is_i(age) then
        puts "Age must be integer! Please enter student age again:"
        next
      end
      passed = true;
    end while not passed
    return age
  end

  def validate_course_name
    passed = false;
    begin
      name = gets.chomp

      # Check_exist
      if @@courses.any? {|c| c.name == name} then
        puts "This course is existed! Please enter course name again:"
        next
      end
      passed = true;
    end while not passed
    return name
  end

  def validate_student_grade
    passed = false;
    begin
      grade = gets.chomp
      # Check integer
      if !is_i(grade) then
        puts "Grade must be integer! Please enter student grade again:"
        next
      end
      passed = true;
    end while not passed
    return grade
  end

  def validate_course_index
    passed = false;
    begin
      index = gets.chomp
      # Check integer
      if !is_i(index) then
        puts "Your choice is invalid! Please choose course again:"
        next
      end
      # Check in range
      if index.to_i > @@courses.length then
        puts "Your choice is invalid! Please choose course again:"
        next
      end
      passed = true;
    end while not passed
    return index.to_i-1
  end

  def is_i(id)
    /\A[-+]?\d+\z/ === id
  end

  def print_menu
    puts "\nPlase select an option:"
    puts "1) Add student information"
    puts "2) Add course information"
    puts "3) Record student grade"
    puts "4) Look up for grade of student"
    puts "5) Exit"
  end

end

program = Program.new
program.run
