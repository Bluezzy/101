PRODUCT = [
  {  name: "Thinkpad x210", price: 220 }, #0
  {  name: "Thinkpad x220", price: 250 }, #1
  {  name: "Thinkpad x250", price: 979 }, #2
  {  name: "Thinkpad x230", price: 300 }, #3
  {  name: "Thinkpad x230", price: 330 }, #4
  {  name: "Thinkpad x230", price: 350 }, #5
  {  name: "Thinkpad x240", price: 700 }, #6 
  {  name: "Macbook Leopard", price: 300 }, #7
  {  name: "Macbook Air", price: 700 },   #8
  {  name: "Macbook Pro", price: 600 },   #9
  {  name: "Macbook", price: 1449 },      #10
  {  name: "Dell Latitude", price: 200 }, #11
  {  name: "Dell Latitude", price: 650 }, #12
  {  name: "Dell Inspiron", price: 300 }, #13
  {  name: "Dell Inspiron", price: 450 }, #14
]

query = {
  price_min: 240,
  price_max: 280,
  q: "thinkpad"
}

query2 = {
  price_min: 300,
  price_max: 450,
  q: 'dell'
}

def search(query)
  result = PRODUCT.select do |laptop|
    range_prize = (query[:price_min]..query[:price_max]).to_a
    laptop_name = laptop[:name].downcase
    ( laptop_name.include?(query[:q]) ) && ( range_prize.include?(laptop[:price]) )
  end
  result
end

p search(query2)
# [ { name: "Dell Inspiron", price: 300 },
#   { name: "Dell Inspiron", price: 450 }]

p search(query)
# [ {name: "Thinkpad x220", price: 250 } ]