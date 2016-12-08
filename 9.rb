def input_students
  puts "Please enter the names of the students"
  puts "If you are finished, just leave the inputs blank"
  students = []
  name = gets.chomp.capitalize.to_sym
  puts "What cohort are they in?"
  months = [:january, :febuary, :march, :april, :may, :june, :july, :august, :september, :october, :november, :december]
  cohort = gets.chomp.downcase.to_sym
  if cohort.empty? == true
    cohort = :november
  end
  while !months.include? cohort do
    puts "Thats not a valid month"
    cohort = gets.chomp.downcase.to_sym
  end
  while !name.empty? do
    students << { name: name, cohort: cohort }
    puts "Now we have #{students.count} students"
    puts "What is the next students name?"
    name = gets.chomp.capitalize.to_sym
    puts "What cohort are they in?"
    cohort = gets.chomp.downcase.to_sym
    if cohort.empty? == true
      cohort = :november
    end
    while !months.include? cohort do
      puts "Thats not a valid month"
      cohort = gets.chomp.downcase.to_sym
    end
  end
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

def no_students
  puts "You didn't enter any students"
end


def interactive_menu
  students = []
  loop do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    selection = gets.chomp
    case selection
    when "1"
      students = input_students
    when "2"
      if students != []
        print_header
        print(students)
        print_footer(students)
      else
        no_students
      end
    when "9"
      exit
    else
      puts "Idek wut u mean"
    end
  end
end

interactive_menu
