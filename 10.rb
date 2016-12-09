@students = []
def input_students
  puts "Please enter the names of the students"
  puts "If you are finished, just leave the inputs blank"
  name = gets.chomp.capitalize
  while !name.empty? do
    @students << { name: name, cohort: :november }
    puts "Now we have #{@students.count} students"
    puts "What is the next students name?"
    name = gets.chomp.capitalize
  end
end

def interactive_menu
  loop do
    print_menu
    selection = gets.chomp
    case selection
    when "1"
      @students = input_students
    when "2"
      show_students
    when "9"
      exit
    else
      puts "Idek wut u mean"
    end
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def show_students
  if @students != []
    print_header
    print_student_list
    print_footer
  end
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "9"
    exit
  else
    puts "I don't know what that means"
end

end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end







interactive_menu
