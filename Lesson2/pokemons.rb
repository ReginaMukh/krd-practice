def pokemon (n)
    pokemon_arr=[]
 n.times do
    puts 'name'
    name=gets.chomp
    puts 'color'
    color=gets.chomp
    pokemon_arr<<{name:name, color:color}  
 end
 p pokemon_arr
end 


puts "How many pokemons to add?"
    n = gets.to_i
if n<=0
  puts "Input is not correct!"
else
   pokemon(n)
end
