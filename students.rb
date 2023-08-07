current_path=File.dirname(__FILE__)
FILE_PATH = current_path + '/city/people_list.txt'
RESULTS = current_path + '/city/results.txt'

file=File.open(FILE_PATH,'r')
students = file.readlines
file.close()

final_result = []
list = []

while true do
  break if students.empty?
  print "\nВведите возраст: "
  input = gets.chomp.ljust(2)
  break if input == "-1"
  
	# находим нужные строки и добавляем в массив
  students.each do |line|
    if line.split(" ").include?(input)
      list << line
    end
  end
  
  # пишем в файл если есть что писать
  unless list.empty?
    File.open(RESULTS, 'a') do |file| 
      file.puts list
    end
  end

  puts "Студентов такого возраста в списке нет!" if list.empty?

  final_result << list
  list = []
  #Тех кого нашли и записали в файл, исключаем из дальнейшего поиска
  students=students.reject {|item| item.split(" ").include?(input)}
end

puts final_result