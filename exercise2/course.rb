class Course
  attr_accessor :name
  attr_accessor :student_info

  def initialize (name)
    self.name = name
    self.student_info = []
  end
end