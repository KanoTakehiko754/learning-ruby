puts "あなたの年齢は？"
age = gets.chomp.to_i

if age == 60
    cost = 10
elsif age > 25
    cost = 1000
elsif age >= 20
    cost = 800
else
    cost = 200
end

puts "クーポンを持っていれば1、持っていなければ0を入力してください。"
coupon = gets.chomp
if coupon == "1"
    cost -= 200
    if cost < 0
        cost = 0
    end
end

puts "あなたの料金は#{cost}円です。"