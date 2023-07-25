def wordCS
    puts 'Put some word,please:'
    word=gets.strip.downcase
    if word.end_with?('cs')
    2**word.length
    else word.reverse!
   end
end
puts wordCS

#second varient
#def wordCS
#    word=ARGV[0].to_s.strip.downcase
#    n=word.length
#    if word.end_with?('cs')
#        puts 2**n
#   else puts word.reverse!
#   end
#end
    
#wordCS