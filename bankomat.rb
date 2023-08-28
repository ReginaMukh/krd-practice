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
        data.close
    end
end

class CashMachine
  extend FileOpen

    def initialize
        @balance = CashMachine.openfile
    end

    def balance
        @balance
    end

    def showbalance
        "  ВАШ БАЛАНС #{@balance}"
    end

    def put_money (inp_depoz)
        inp_depoz = inp_depoz.to_i
        if inp_depoz > 0
             @balance += inp_depoz
            "ПОПОЛНЕНИЕ НА СУММУ: #{inp_depoz}  <<ВАШ БАЛАНС #{@balance}>>"
        else 
             "\n !Не корректный ввод!"
        end
    end

    def takeof_money (sum)
        sum = sum.to_i
        if sum>0 && sum<=@balance
             @balance -= sum
            "СНЯТИЕ СУММЫ:#{sum}  <<ВАШ БАЛАНС #{@balance}>>"
        else 
            "\n  Не корректный ввод Сумма не может превышать #{@balance} и быть меньше нуля(0)!"
        end
    end

    def close_write
        @itog = CashMachine.write_file (@balance)
    end

    
end
