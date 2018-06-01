class Student
  #Student has student ID, name, age, gender
  attr_accessor :id
  attr_accessor :name
  attr_accessor :age
  attr_accessor :gender

  def initialize(id, name, age, gender)
    self.id = id
    self.name = name
    self.age = age
    self.gender = gender
  end
end