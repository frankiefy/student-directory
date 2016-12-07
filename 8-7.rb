=begin
In the input_students method the cohort value is hard-coded.
How can you ask for both the name and the cohort?
What if one of the values is empty?
Can you supply a default value?
The input will be given to you as a string
How will you convert it to a symbol?
What if the user makes a typo?
=end

def input_students
  puts "Please enter the names of the students"
  puts "If you are finished, just leave the input blank"
  #create epmty array
  students = []
  #get first name
  name = gets.chomp.capitalize
  puts "What cohort are they in?"
  cohort = gets.chomp.downcase
  if cohort == ""
    cohort = "november"
  end
  #while name != nil, repeat code
  while !name.empty? do
    #add the student hash to the array
    students << { name: name, cohort: cohort }
    puts "Now we have #{students.count} students"
    #get another name from the user
    puts "What is the next students name?"
    name = gets.chomp.capitalize
    puts "What cohort are they in?"
    cohort = gets.chomp.downcase
    if cohort == ""
      cohort = "november"
    end
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
    puts "#{i+1}. #{n[:name]} (#{n[:cohort]} cohort)" }
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
