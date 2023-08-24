current_path=File.dirname(__FILE__)
FILE_PATH = current_path + '/city.txt'
BUFFER = 'buffer.txt'

#1 метод,который выводит все строки
def index
  city=[]
  File.foreach(FILE_PATH){|line| city.push(line.chomp)}
  city
end
    
#2 находит конкретную строку в файле и выводит её
def find(id)
  nw_id=id-1
  file=File.open(FILE_PATH,'r')
  lines=file.readlines.map(&:chomp)
  if id>lines.length
    puts ("нет такой строки")
  else 
    puts lines[nw_id]
  end
  file.close()
end

#3 находит все строки, где есть указанный паттерн
def where(pattern)
  file=File.open(FILE_PATH,'r')
  new=[]
  lines=file.readlines
  lines.each.with_index do|line, index|
    if line.include?(pattern)
     new<<lines[index]
    end
  end
  puts new.empty? ? "This pattern not find!" : new
  file.close()
end  

#4 обновляет конкретную строку файла
def update(id, text)
  file_buffer=File.open(BUFFER, 'w')
  File.foreach(FILE_PATH).with_index do |city, index|
    file_buffer.puts(id == index+1 ? text : city)
  end
  file_buffer.close()
  File.write(FILE_PATH,File.read(BUFFER))
  File.delete(BUFFER) if File.exist?(BUFFER)
end

#5 удаляет строку
def delete(id)
  file_buffer=File.open(BUFFER, 'w')
  file=File.open(FILE_PATH)
  lines=file.readlines
  if id>lines.length
    puts ("нет такой строки")
    return
  else
    lines.delete_at(id-1)
    file_buffer.puts lines
  end
  file_buffer.close()
  file.close()
  File.write(FILE_PATH,File.read(BUFFER))
  File.delete(BUFFER) if File.exist?(BUFFER)
end

#6 добавляет строку в конец файла
def create(name)
  File.open(FILE_PATH, 'a') {|file| file << name}
end


#1 puts "--File contains the following information--"
#puts index 

#2 puts "FInd 4 line"
#puts find(4)

#3 puts "find pattern u"
#where("u")

#4 
#update(2,"i changed 2 line")

#5
#delete(2)

#6
create("i added the line")