class ArkTwelvedata
    attr_accessor :arkk_open, :arkk_close
    include HTTParty
    base_uri "api.twelvedata.com/"

    def initialize
        self.startup
    end 

    def startup
        self.arkk
        self.tsla
        self.pypl
    end

    def stock
        stock = self.new
        stock.startup
        @stock = stock
    end 

    def arkk
        arkk_info = '/time_series?symbol=ARKK&interval=1day&apikey=716b4530d098461283fb2c02408a6bb8'
        
        var = self.class.get(arkk_info)
        @arkk_open = var["values"][0]["open"].to_i
        @arkk_close = var["values"][0]["close"].to_i
        @arkk_symbol = var["meta"]["symbol"]
        @arkk_percent = (100.0 * (@arkk_close - @arkk_open) / @arkk_open) * 100 
        puts "$ARKK DATA HAS BEEN UPDATED"
        return "------------------------"
    end 

    def arkk_open
        @arkk_open
    end 
    
    def arkk_close
        @arkk_close
    end 

    def arkk_symbol
        @arkk_symbol
    end 
 
    def arkk_percent_change
        (@arkk_percent).round / 100.0
    end  

    def tsla
        tsla_info = '/time_series?symbol=TSLA&interval=1day&apikey=716b4530d098461283fb2c02408a6bb8'

        var = self.class.get(tsla_info)

        @tsla_open = var["values"][0]["open"].to_i
        @tsla_close = var["values"][0]["close"].to_i
        @tsla_symbol = var["meta"]["symbol"]
        @tsla_percent = (100.0 * (@tsla_close - @tsla_open ) / @tsla_open) * 100 
        puts "$TSLA DATA HAS BEEN UPDATED"
        return "------------------------"
    end  

    def tsla_open
        @tsla_open
    end 
    
    def tsla_close
        @tsla_close
    end 

    def tsla_symbol
        @tsla_symbol
    end 
 
    def tsla_percent_change
        (@tsla_percent).round / 100.0
    end 

    def pypl
        pypl_info = '/time_series?symbol=PYPL&interval=1day&apikey=716b4530d098461283fb2c02408a6bb8'
        
        var = self.class.get(pypl_info)

        @pypl_open = var["values"][0]["open"].to_i
        @pypl_close = var["values"][0]["close"].to_i
        @pypl_symbol = var["meta"]["symbol"]
        @pypl_percent = (100.0 * (@pypl_close - @pypl_open) / @pypl_open) * 100 
        puts "stock DATA HAS BEEN UPDATED"
        return "------------------------"
    end  

    def pypl_open
        @pypl_open
    end 
    
    def pypl_close
        @pypl_close
    end 

    def pypl_symbol
        @pypl_symbol
    end 
 
    def pypl_percent_change
        (@pypl_percent).round / 100.0
    end 

end