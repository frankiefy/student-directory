@students = []
def input_students
  puts "Please enter the names of the students"
  puts "If you are finished, just leave the inputs blank"
  @name = STDIN.gets.chomp.capitalize
  while !@name.empty? do
    save_to_students
    puts "Now we have #{@students.count} students"
    puts "What is the next students name?"
    @name = STDIN.gets.chomp.capitalize
  end
  print_student_list
  puts "Successful? (y/n)"
  success = gets.chomp
  if success == "n"
    puts "You'll have to start again!"
    exit
  end
end

def try_load_students
  filename = ARGV.first
  if filename.nil?
    load_students(filename = "students.csv")
elsif File.exists?(filename)
    load_students(filename)
      puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  @name, @cohort = line.chomp.split(',')
    save_to_students
  end
  file.close
  puts "<successfully loaded students!>"
end

def save_to_students
  @students << {name: @name, cohort: :november}
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input students"
  puts "2. Show current students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
    print_header
    print_student_list
    print_footer
    puts "<successfully showed current students>"
end

def process(selection)
  case selection
  when "1"
    puts "<inputing students>"
    input_students
  when "2"
    puts "<showing current students>"
    show_students
  when "3"
    puts "<saving current students to students.csv>"
    save_students
  when "4"
    puts "<loading students from students.csv>"
    load_students
  when "9"
    puts "Goodbye!"
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

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
  puts "<successfully saved current students to students.csv>"
end



try_load_students
interactive_menu
