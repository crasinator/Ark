class ArkLogic  
    attr_accessor :sells, :buys

    def initialize
        @buys = []
        @buy_names =[]
        @buy_share_count = []
        @buy_list = ""
        @sells = []
        @sell_names =[]
        @sell_share_count = []
        @sell_list = ""
        self.doc
    end 

    def doc 
        doc = Roo::Excelx.new('./fixtures/arktrade5.xlsx')
        sheet = doc.sheet(0)

        sheet.each(
            tick: 'Ticker', 
            name: 'Name',
            shares: 'Shares', 
            direction: 'Direction'
        ) do |info|
            if info[:direction] == "Buy"
                test = Hash.new
                test[:name] = info[:name]
                test[:tick] = info[:tick]
                test[:direction] = "Buy"
                test[:shares] = info[:shares]
                @buys << test
                @buy_names << test[:name]
                @buy_share_count << test[:shares].to_i 
            elsif info[:direction] == "Sell"
                sell = Hash.new
                sell[:name] = info[:name]
                sell[:tick] = info[:tick]
                sell[:direction] = "Sell"
                sell[:shares] = info[:shares]
                @sells << sell
                @sell_names << sell[:name]
                @sell_share_count << sell[:shares].to_i
            end
        end 
    end 

    def sell_share_count 
        @sell_share_count.inject(:+).to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse
    end 

    def buy_share_count
        @buy_share_count.inject(:+).to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse
    end 

    def bowser_box
        @sells.sample(1)[0][:tick]
        #picks a stock from list of sells and returns ticker (symbol)
    end 

    def question_box
        @buys.sample(1)[0][:tick]
        #picks a stock from list of buys and returns ticker (symbol)
    end 
    
    def buy_names
        @buy_names.uniq
    end 

    def sell_names
        @sell_names.uniq
    end 

    def buy_list
       @buy_list = self.buy_names.each do |x|
            puts "#=>       ✩ #{x}"
            sleep(0.5)
        end 
        return nil
    end 

    def sell_list
        @sell_list = self.sell_names.each do |x|
            puts "#=>       ✩ #{x}"
            sleep(0.5)
        end
        return nil
    end 

end 

