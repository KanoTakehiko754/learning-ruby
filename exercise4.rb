# 標準ライブラリであるjsonをrequire
require 'json'

# 外部ライブラリであるfaradayをrequire
require 'faraday'

# faradayを使って https://next-chat-kohl.vercel.app/api/room_ids にGETメソッドでリクエストを送信
response = Faraday.get("https://next-chat-kohl.vercel.app/api/room_ids")

# response.bodyにレスポンスが入っている
# response.bodyはJSON文字列なので、JSON.parseで文字列からrubyのハッシュに変換する
room_ids = JSON.parse(response.body)

puts room_ids

# 投稿一覧の取得
id1 = room_ids["roomIds"][0]# room-1についての投稿を取得

response = Faraday.get("https://next-chat-kohl.vercel.app/api/posts", room_id: id1)
hoge = JSON.parse(response.body)

puts hoge