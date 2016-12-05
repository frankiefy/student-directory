=begin
Our code only works with the student name and cohort.
Add more information: hobbies, country of birth, height, etc.
=end

def print_input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp.capitalize
  while !name.empty? do
    students << { name: name, cohort: :november }
    puts "Now we have #{students.count} students"
    name = gets.chomp.capitalize
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each_with_index { |n,i| puts "#{i+1}. #{n[:name]} (#{n[:cohort]} cohort)"}
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

def add_student_info
  puts "Which student?"
  student_name = gets.chomp
  student_name = Array.new
  puts "Hobbies?"
  hobbies = gets.chomp
  student_name << hobbies
  puts "Country of birth?"
  cob = gets.chomp
  student_name << cob
  puts "Height?"
  height = gets.chomp
  student_name << height
  puts "All done!"
  puts "So, just to check I got all that:"
  puts "The student's hobbies are #{student_name[0]}"
  puts "The student's country of birth is #{student_name[1]}"
  puts "The student is #{student_name[2]} meters tall"
end

students = print_input_students
print_header
print(students)
print_footer(students)
puts "Do you want to add more information? (y/n)"
  reply = gets.chomp
  if reply == "y"
    add_student_info
  end
