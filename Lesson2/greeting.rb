def greeting(username,usersurname,userage)

if userage < 18
    puts "Привет #{username.capitalize } #{usersurname.capitalize}!
Тебе меньше 18 лет,но начать учиться программировать никогда не рано!"
else
    puts "Привет #{username.capitalize } #{usersurname.capitalize }!Самое время заняться делом!"
end
end

puts "Приветствуем! "

puts "Введите ваше имя "
name=gets.strip

puts "Введите вашу фамилию "
surname=gets.strip

puts "Введите ваш возраст "
age=gets.to_i

greeting(name,surname,age)
