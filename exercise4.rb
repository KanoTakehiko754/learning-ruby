# 第1引数が与えられていなければエラーを出す
if !ARGV[0]
    raise "引数を与えてください。"
end

# コマンドライン引数に"rooms"が与えられているか確認
arg_rooms = ARGV[0] == "rooms"

# コマンドライン引数に"posts"が与えられているか確認
arg_posts = ARGV[0] == "posts"

# コマンドライン引数に"submit-post"が与えられているか確認
arg_submit = ARGV[0] == "submit-post"

# 部屋idを確認(3パターンで共通)
room_id = ARGV[1]
if !arg_rooms && !room_id
    raise "部屋idを与えてください。"
end

# 投稿の内容を確認
content = ARGV[2]
if arg_submit && !content
    raise "投稿の内容を入力してください。"
end

# 標準ライブラリであるjsonをrequire
require 'json'

# 外部ライブラリであるfaradayをrequire
require 'faraday'

# faradayを使って https://next-chat-kohl.vercel.app/api/room_ids にGETメソッドでリクエストを送信
response = Faraday.get("https://next-chat-kohl.vercel.app/api/room_ids")

# response.bodyにレスポンスが入っている
# response.bodyはJSON文字列なので、JSON.parseで文字列からrubyのハッシュに変換する
room_ids = JSON.parse(response.body)

# コマンドライン引数に"rooms"が与えられていればroom_idsを表示
if arg_rooms
    puts room_ids
end

# コマンドライン引数に"posts"が与えられていれば投稿を表示
if arg_posts
    response = Faraday.get("https://next-chat-kohl.vercel.app/api/posts", room_id: room_id)
    posts = JSON.parse(response.body)
    puts posts
end

# コマンドライン引数に"submit-post"が与えられていれば投稿を送信
if arg_submit
    json_str = "{\"roomId\": \"#{room_id}\",\"content\": \"#{content}\"}"
    res = Faraday.post("https://next-chat-kohl.vercel.app/api/posts", json_str, "Content-Type" => "application/json")
    puts "投稿を送信しました。部屋ID：「#{room_id}」、内容：「#{content}」"
end