def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create epmty array
  students = []
  #get first name
  name = gets.chomp.downcase
  #while name != nil, repeat code
  while !name.empty? do
    #add the student hash to the array
    students << { name: name, cohort: :november }
    puts "Now we have #{students.count} students"
    #get another name from the user
    name = gets.chomp.downcase
  end
  #return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each_with_index {
    |n,i|
    puts "#{i+1}. #{n[:name]} (#{n[:cohort]} cohort)" if n[:name].length < 12 }
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
