# コマンドライン引数に"rooms"が与えられているか確認
arg_rooms = ARGV[0] == "rooms"

# コマンドライン引数に"posts"が与えられているか確認する。与えられていたら部屋IDを確認し、グローバル変数room_idに保存する
arg_posts = ARGV[0] == "posts"
if arg_posts
    $room_id = ARGV[1]
    if ! $room_id
        raise "部屋IDを与えてください。"
    end
end

# コマンドライン引数に"submit-post"が与えられているか確認し、与えられていたら内容も確認し、グローバル変数contentに保存する
arg_submit = ARGV[0] == "submit-post"
if arg_submit
    $room_id = ARGV[1]
    $content = ARGV[2]
    if ! $room_id
        raise "部屋IDを与えてください。"
    end
    if ! $content
        raise "投稿の内容を与えてください。" 
    end
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

# コマンドライン引数に"posts"または"submit-post"が与えられていなければroom_idsを表示
if ! arg_posts && ! arg_submit
    puts room_ids
end

# コマンドライン引数に"rooms"または"submit-post"が与えられていなければ投稿を表示
if ! arg_rooms && ! arg_submit
    response = Faraday.get("https://next-chat-kohl.vercel.app/api/posts", room_id: $room_id)
    posts = JSON.parse(response.body)
    puts posts
end

# コマンドライン引数に"rooms"または"posts"が与えられていなければ投稿を送信
if ! arg_rooms && ! arg_posts
    Faraday.post("https://next-chat-kohl.vercel.app/api/posts", "{\"roomId\": #{$room_id},\"content\": #{$content}", "Content-Type" => "application/json")
    puts "投稿を送信しました。部屋ID：「#{$room_id}」、内容：「#{$content}」"
end