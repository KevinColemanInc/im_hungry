require 'net/http'
require 'json'

module ImHungry
  class FetchJson
    def self.fetch(url, model)
      uri = URI.parse(url)
      req = Net::HTTP::Get.new(uri)
      res = Net::HTTP.start(uri.host, uri.port) do |http|
        http.request(req)
      end
      raise "HTTP code #{res.code} - Failure fetching json" if res.code != '200'
      self.to_model(res.body, model)
    rescue SocketError
      puts 'Network connectivity issue'
      exit
    rescue Errno::ECONNREFUSED => e
      puts 'The server is down.'
      puts e.message
      exit
    rescue Timeout::Error => e
      puts 'Timeout error occurred.'
      puts e.message
      exit
    rescue Errno::EINVAL, Errno::ECONNRESET, EOFError,
           Net::HTTPBadResponse, Net::HTTPHeaderSyntaxError,
           Net::ProtocolError => e
      puts 'Error occurred.'
      puts e.message
      exit
    end

    def self.to_model(body, model)
      JSON.parse(body).map do |food_truck_json|
        model.new(food_truck_json)
      end
    rescue JSON::ParserError => e
      puts 'Invalid JSON'
      puts e.message
      exit
    end
  end
end
