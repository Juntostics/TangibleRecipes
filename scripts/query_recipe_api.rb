require 'json'
require 'httparty'

app_id = 'You need to update here'

BASE_URL = "https://app.rakuten.co.jp/services/api/"
def recipeCategoryListUrl(app_id)
  "#{BASE_URL}Recipe/CategoryList/20121121?format=json&categoryType=small&applicationId=#{app_id}"
end

def recipeRankingUrl(app_id, category_id)
  "#{BASE_URL}Recipe/CategoryRanking/20121121?format=json&categoryId=#{category_id}&applicationId=#{app_id}"
end

def getJson(url)
  JSON.parse(HTTParty.get(url).body)
end

def normalize(str)
  str.gsub!(/[※★☆●○◎■▲◆]/, "")
  return "" if str.empty?
  str = str.split("（")[0]
  return "" if str.nil? || str.empty?
  str = str.split("(")[0]
  return "" if str.nil? || str.empty?
  str.tr!('ァ-ン', 'ぁ-ん')
  str
end

def saveRawResult(id, content)
  File.open("raw/#{id}.json", "w") do |f|
    f.write content
  end
end

def saveAsJson(obj, name)
  File.open(name, "w") do |f|
    f.write JSON.pretty_generate(obj)
  end
end

def saveToFile(i, foods)
  File.open("foods#{i}.json", "w") do |f|
    f.write("[")
    buf = nil
    foods.each do
      |food|
      f.write(buf.to_json + ",\n") if buf
      buf = food
    end
    f.write(buf.to_json + "\n]")
  end
end

# 途中まで読んでこけた時用
def readLastResult(file_name)
  foods = []
  json = nil
  open(file_name) do |io|
    json = JSON.load(io)
  end
  json.each do |food|
    foods << food.each_with_object({}){|(k,v), h| h[k.to_sym] = v}
  end
  foods
end

def isKnownFood(foods, category)
  foods.each do |food| 
    if category.eql?(food[:name]) then
      return true
    end
  end
  false
end

foods = []
p "fetch recipes list..."
jsonResponse = getJson(recipeCategoryListUrl(app_id))
File.open("category_list.json", "w") do |f|
  f.write JSON.pretty_generate(jsonResponse)
end
num_of_categories = jsonResponse["result"]["small"].length
p "#{num_of_categories} items"

i = 0
jsonResponse["result"]["small"].each do |category|
  i = i + 1
  if isKnownFood(foods, category["categoryName"]) then
    next
  end
  if i % 10 == 0 then
    p "#{i} item proccessed, progress #{(i/num_of_categories.to_f * 10000).to_i / 100}%"
    if i % 50 == 0 then
      saveToFile(i, foods)
    end
  end
  url = category["categoryUrl"]
  fullId = url.match(/[0-9\-]+/)[0]
  food = {
    name: category["categoryName"],
    fullId: fullId,
    largeCategory: fullId.split("-")[0]
  }
  if food[:name].include?("その他") then
    next
  end
  detailResponse = getJson(recipeRankingUrl(app_id, fullId))
  saveRawResult(fullId, detailResponse)
  if detailResponse["error"] then
    p "Error at #{i}-th data" + detailResponse["error"]
    return
  end
  ingredients = {}
  detailResponse["result"].each do |recipe|
    recipe["recipeMaterial"].each do |material|
      normalized = normalize(material)
      if normalized and not normalized.empty? then
        ingredients[normalized] = (ingredients[normalized] || 0) + 1
      end
    end
  end
  food[:num_of_recipes] = detailResponse["result"].length
  food[:ingredients] = ingredients
  foods << food
  sleep(2)
end

saveToFile("all", foods)


