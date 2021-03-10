require 'uri'
require 'net/http'
require 'openssl'

class LivetennisnewsController < ApplicationController
  def news
    # Guardian API KEY = 4f724b82-90ef-4d6d-8ec5-054543388de5
    responseFromGuardian = HTTParty.get('https://content.guardianapis.com/search?show-fields=bodyText&tag=sport/tennis&api-key=4f724b82-90ef-4d6d-8ec5-054543388de5')
    # convert the result into JSON object
    @result = JSON.parse(responseFromGuardian.body)

    # Live Schedule of Tennis tournaments from Sports Radar API  Key: sfc55a4ekmh7pyjqsyp463cc
    url = URI("http://api.sportradar.us/tennis-t2/en/schedules/live/schedule.json?api_key=sfc55a4ekmh7pyjqsyp463cc")


    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)

    response = Net::HTTP.start(url.hostname, url.port, use_ssl: url.scheme == 'https', verify_mode: OpenSSL::SSL::VERIFY_NONE) do |http|
      http.request(request)
    end
    @response = JSON.parse(response.body)
    puts @response
  end
end
  