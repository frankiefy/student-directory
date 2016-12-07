=begin
change the way the users are displayed: print them grouped by cohorts.
you'll need to get a list of all existing cohorts: map()
iterate over it and only print the students from that cohort.
=end

def input_students
  puts "Please enter the names of the students"
  puts "If you are finished, just leave the input blank"
  #create epmty array
  students = []
  #get first name
  name = gets.chomp.capitalize.to_sym
  puts "What cohort are they in?"
  cohort = gets.chomp.downcase.to_sym
  if cohort.empty? == true
    cohort = :november
  end
  #while name != nil, repeat code
  while !name.empty? do
    #add the student hash to the array
    students << { name: name, cohort: cohort }
    puts "Now we have #{students.count} students"
    #get another name from the user
    puts "What is the next students name?"
    name = gets.chomp.capitalize.to_sym
    puts "What cohort are they in?"
    cohort = gets.chomp.downcase.to_sym
    if cohort.empty? == true
      cohort = :november
    end
  end
  #return the array of students
  students
end



def print(students)
  cohort_to_view = []
  puts "What cohort would you like to view?"
  chosen_cohort = gets.chomp.to_sym
  students.each do
    |x|
    if x[:cohort] == chosen_cohort
      cohort_to_view << x
    end
  end
  cohort_to_view.each_with_index {
    |n,i|
    puts "#{i+1}. #{n[:name]} (#{n[:cohort]} cohort)" }
end



students = input_students
print(students)
