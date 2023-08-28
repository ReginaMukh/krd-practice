require 'socket'
require './app'

#def router(path,params)
    #case path
    #when "/"
    #    "Hello world"
    #when "/user"
    #    "Hello user"
   # when "/bankomat"
    #    balanc_controller (params)
   # else
    #    "404"
    #end 
#end

#def balanc_controller (params)
    #balanc = CashMachine.new
       # case params["method"]
       # when "deposit"
       #     balanc.poloshit(params["title"])
        #else
       #     balanc.showbalance
       # end
#end

app = App.new
server = TCPServer.open('0.0.0.0', 3000)

while connection = server.accept
    request = connection.gets 
    
    method, full_path = request.split (" ")
    path, params = full_path.split ("?")

    status, headers, body = app.call ({
        "REQUEST_METHOD" => method,
        "PATH_INFO" => path,
        "QUERY_STRING" => params
    })

    #response = router(path,params)
    #status = response == "404" ? "404" : "200"

    connection.print "HTTP/1.1 #{status}\r\n"
    headers.each do |key, value|
    connection.print "#{key}: #{value}; charset=UTF-8\r\n"
    end
    connection.print "\r\n"
    body.each do |part|
    connection.print part
    end

    connection.close
end