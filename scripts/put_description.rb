require 'nokogiri'
require 'httparty'
require 'cgi'
$yahooAppId = 'You need to update here'

# YahooのふりがなAPIを使って文章にふりがなをつける
def put_furigana(sentence)
  if sentence.empty? then
    return ""
  end
  url = "http://jlp.yahooapis.jp/FuriganaService/V1/furigana?appId=#{$yahooAppId}&grade=1&sentence=#{CGI.escape(sentence)}"
  responseBody = HTTParty.get(url).body
  doc = Nokogiri::XML(responseBody)
  namespace = {namespace: "urn:yahoo:jp:jlp:FuriganaService"}
  words = doc.xpath('//namespace:Word', namespace)
  result = ''
  words.each do |element|
    result = result + element.xpath('./namespace:Surface', namespace).children.text
    kana =  element.xpath('./namespace:Furigana', namespace).children.text
    unless kana.empty? then
      result = result + "(#{kana})"
    end
  end
  result
end

# Wikipediaを利用して単語の説明文を取得する
def fetch_description(word)
  url = "http://ja.wikipedia.org/wiki/#{URI.escape(word)}"
  doc = Nokogiri::HTML(HTTParty.get(url).body)
  desc = doc.xpath("//div[@id='mw-content-text']/p[1]").text
  desc.gsub!(/\[.*\]/, '')
  desc.gsub(/（.*）/, '')
end
