#!/usr/bin/env ruby
class Wizard
  def show_magic
    puts "Enter a number between 1 and 10 and I will show you the  magic:"
    @num = gets.chomp.to_i

    # Validate the input to prevent cheater
    if !validate_input() then
      puts "Bye you cheater!"
      exit
    end

    # Draw magic triangle with 2 loops
    puts "Look at this beautiful triangle:"
    draw()
  end

  def validate_input()
    return @num.between?(1,10)
  end

  def draw()
    for i in 1..@num do
      for j in 1..i do
        print "*"
      end
      print "\n"
    end
  end

end

# Time for the wizard to work!
wizard = Wizard.new
wizard.show_magic
