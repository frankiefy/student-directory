def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create epmty array
  students = []
  #get first name
  name = gets.chomp
  #while name != nil, repeat code
  while !name.empty? do
    #add the student hash to the array
    students << { name: name, cohort: :november }
    puts "Now we have #{students.count} students"
    #get another name from the user
    name = gets.chomp
  end
  #return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  puts "What is the first letter of the name of the student you would like to search for?"
  first = gets.chomp
  first_students = students.select do |student|
     student[:name][0] == first
   end
  num_students = 1
  first_students.each do |student|
    puts "#{num_students}. #{student[:name]} (#{student[:cohort]} cohort)"
    num_students += 1
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
