#Программа чтения/записи банковского баланса клиента.
START = 100
current_path=File.dirname(__FILE__)
FILE_PATH = current_path + '/balance.txt'

unless File.exist?(FILE_PATH )
  file = File.new(FILE_PATH, "w")
  File.write(FILE_PATH, START)
end

file = File.open(FILE_PATH, "r")
file_data = file.read.to_i
file.close

while true do
  puts "\n---ВЫБЕРИТЕ ДЕЙСТВИЕ: \n
  ---внести деньги (нажмите 'D'или'd')
  ---снять деньги (нажмите 'W'или'w')
  ---проверить баланс (нажмите 'B'или'b')
  ---выход (нажмите 'Q'или'q')\n"
  vvod=gets.chomp.upcase
    if vvod == 'D'
      loop do
        puts "\n Какую сумму вы хотите положить?\n Выберите сумму пополнения: [10] [100] [50] [500] [1000]?"
        depozit = [10, 100, 50, 500, 1000]
        inp_depoz = gets.to_i
          if inp_depoz > 0 && depozit.include?(inp_depoz)
            file_data += inp_depoz
            puts "ВАШ БАЛАНС #{file_data}"
            break
          else puts "\n !Не корректный ввод! Выберите из предлагаемых вариантов!"
          end
      end
    end
        
    if vvod == 'W'
      loop do
        puts " Какую сумму вы хотите снять? "
        nal=gets.to_i
          if nal>0 && nal<=file_data
            file_data -= nal
            puts "  ВАШ БАЛАНС #{file_data}"
            break
          else puts "\n  Не корректный ввод Сумма не может превышать #{file_data} и быть меньше нуля(0)!"
          end
      end
    end    

    if vvod == 'B'
      puts "  ВАШ БАЛАНС #{file_data}"
    end

    if vvod == 'Q'
      File.open("balance.txt", "w")
      File.write("balance.txt", file_data)
      break
    end
end