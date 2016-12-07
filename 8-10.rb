=begin
We've been using the chomp() method to get rid of the return character.
Find another method among those provided by the String class
that could be used for the same purpose
(although it will require passing some arguments)
=end

#i changed chomp to strip

def input_students
  puts "Please enter the names of the students"
  puts "If you are finished, just leave the inputs blank"
  #create epmty array
  students = []
  #get first name
  name = gets.strip.capitalize.to_sym
  puts "What cohort are they in?"
  months = [:january, :febuary, :march, :april, :may, :june, :july, :august, :september, :october, :november, :december]
  cohort = gets.strip.downcase.to_sym
  if cohort.empty? == true
    cohort = :november
  end
  while !months.include? cohort do
    puts "Thats not a valid month"
    cohort = gets.strip.downcase.to_sym
  end
  #while name != nil, repeat code
  while !name.empty? do
    #add the student hash to the array
    students << { name: name, cohort: cohort }
    puts "Now we have #{students.count} students"
    #get another name from the user
    puts "What is the next students name?"
    name = gets.strip.capitalize.to_sym
    puts "What cohort are they in?"
    cohort = gets.strip.downcase.to_sym
    if cohort.empty? == true
      cohort = :november
    end
    while !months.include? cohort do
      puts "Thats not a valid month"
      cohort = gets.strip.downcase.to_sym
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
