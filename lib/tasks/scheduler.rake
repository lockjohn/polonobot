require 'httparty'
require 'date'

desc "This task is called by the Heroku scheduler add-on"

task :fetch_candles do 
    puts "fetching candles"
    #get a list of the coins you need to use
    coins = CoinPair.all.pluck(:coin_pair_name)
    #iterate through each element of coins and make http request
    coins.each do |coin_pair|
        response = HTTParty.get("https://poloniex.com/public?command=returnChartData&currencyPair=#{coin_pair}&start=1405699200&end=9999999999&period=14400")
        response.parsed_response.each do |entry|
            candle = Candle.new do |c|
                c.coin_pair = coin_pair
                c.date = Time.at(entry['date']).to_datetime
                c.high = entry['high']
                c.low = entry['low']
                c.open = entry['open']
                c.close = entry['close']
                c.volume = entry['volume']
            end
            candle.save 
        end
    end
    #save that in a variable
    #create new entry on Candle table with that data

end