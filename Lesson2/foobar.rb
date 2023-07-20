def foobar (first_num,sec_num)

if first_num==20||sec_num==20
    puts "Второе число #{sec_num}"
else
    puts "Сумма чисел: #{first_num+sec_num}"  
end
end

puts "Введите 1 число: "
num1=gets.to_i
puts "Введите 2 число: "
num2=gets.to_i
foobar(num1, num2)
