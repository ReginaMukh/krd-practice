require 'rack'
require './bankomat'

class App
    def call(env)
        req = Rack::Request.new(env)

        params = req.query_string.split("&").map{ |pair| pair.split("=") }.to_h
        router(req.path, params)
        
    end

    def router(path,params)
        case path
        when "/balance"
            result = balanc_controller(0, params)
            [ 200, { "Content-Type" => "text/html" }, [result] ]
        when "/withdraw"
            result = balanc_controller(1, params)
            save_balanc 
            [ 200, { "Content-Type" => "text/html" }, [result] ]
        when "/deposit"
           result = balanc_controller(2, params)
           save_balanc 
           [ 200, { "Content-Type" => "text/html" }, [result] ]
        else
            [ 404, { "Content-Type" => "text/html" }, ["404"] ]
        end 
    end
    
    def balanc_controller(path, params)
        @balanc = CashMachine.new
       if path == 2  
         @balanc.put_money(params["value"]) 
       elsif path == 1  
         @balanc.takeof_money(params["value"]) 
       elsif path == 0
         @balanc.showbalance
       end
    end
     
    def save_balanc        
       CashMachine.write_file (@balanc.balance)
    end
   
end
