def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp.downcase
  while !name.empty? do
    students <<  name + ", (november cohort)"
    puts "Now we have #{students.count} students"
    name = gets.chomp.downcase
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  xyz = 0
  while xyz < students.count
    puts students[0+xyz].capitalize
    xyz += 1
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end


students = input_students
print_header
print(students)
print_footer(students)
