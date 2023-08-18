module FileOpen
    def openfile
        start = 100 #init balance
        current_path=File.dirname(__FILE__)
        file_path = current_path + '/balance.txt'

        unless File.exist?(file_path )
            file = File.new(file_path, "w")
            f_data = File.write(file_path, start)
            file.close
            f_data
        end

        file = File.open(file_path, "r")
        file_data = file.read.to_i
        file.close
        file_data
    end

    def write_file (balance)
        data = File.open("balance.txt", "w")
        File.write("balance.txt", balance)
        #data.close
    end
end

class CashMachine
  extend FileOpen

    def initialize
        @balance = CashMachine.openfile
    end

    def showbalance
        puts "  ВАШ БАЛАНС #{@balance}"
    end

    def put_money
        loop do
          puts "\n Какую сумму вы хотите положить?\n "
          inp_depoz = gets.to_i
          puts "\n Вы хотите положить #{inp_depoz}?\n   Y - ДА ; N - НЕТ "
          inp_answer = gets.chomp.upcase
           if inp_depoz > 0 && inp_answer == 'Y'
                @balance += inp_depoz
                puts "ВАШ БАЛАНС #{@balance}"
                break
            else 
                puts "\n !Не корректный ввод!"
            end
        end
    end

    def takeof_money
        loop do
          puts " Какую сумму вы хотите снять? "
          sum=gets.to_i
            if sum>0 && sum<=@balance
                @balance -= sum
                puts "  ВАШ БАЛАНС #{@balance}"
                break
            else 
                puts "\n  Не корректный ввод Сумма не может превышать #{@balance} и быть меньше нуля(0)!"
            end
        end
    end

    def write_save
        CashMachine.write_file (@balance)
    end


    def self.init
        person_balance = CashMachine.new
        
            loop do
                puts "\n---ВЫБЕРИТЕ ДЕЙСТВИЕ: \n
                ---внести деньги (нажмите 'D'или'd')
                ---снять деньги (нажмите 'W'или'w')
                ---проверить баланс (нажмите 'B'или'b')
                ---выход (нажмите 'Q'или'q')\n"
                vvod=gets.chomp.upcase
    
                person_balance.put_money if vvod == 'D'
                person_balance.takeof_money if vvod == 'W'
                person_balance.showbalance if vvod == 'B'
                break if vvod == 'Q'
            end
        puts 'ДО НОВЫХ ВСТРЕЧ!'
        person_balance.write_save
    end
end
CashMachine.init