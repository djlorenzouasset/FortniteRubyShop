require 'net/http'
require 'uri'
require 'json'
require 'colorize'

puts "Program made by djlorenzouasset".cyan

puts "Requesting data..".green

url = URI.parse('https://fortnite-api.com/v2/shop/br/combined')

response = Net::HTTP.get_response(url)

result = JSON.parse(response.body)

puts "Starting".green 

featured = result['data']['featured']['entries']
daily = result['data']['daily']['entries']

for i in featured

    if i['bundle']
        puts "Bundle \"#{i['bundle']['name']}\" (#{i['bundle']['info']}): prize #{i['finalPrice']} vbucks\n".yellow

   else
    puts "Cosmetic \"#{i['items'][0]['name']}\" (#{i['items'][0]['type']['displayValue']}): prize #{i['finalPrice']} vbucks\n".yellow

   end

end

for i in daily

    if i['bundle']
        puts "Bundle \"#{i['bundle']['name']}\" (#{i['bundle']['info']}): prize #{i['finalPrice']} vbucks\n".yellow

   else
    puts "Cosmetic \"#{i['items'][0]['name']}\" (#{i['items'][0]['type']['displayValue']}): prize #{i['finalPrice']} vbucks\n".yellow

   end

end