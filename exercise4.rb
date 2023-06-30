# コマンドライン引数に"rooms"が与えられているか確認
arg_rooms = ARGV.length > 0 && ARGV[0] == "rooms"

# コマンドライン引数に"posts"が与えられているか確認する。与えられていたら部屋IDを確認し、グローバル変数room_idに保存する
arg_posts = ARGV.length > 0 && ARGV[0] == "posts"
if arg_posts
    $room_id = ARGV[1]
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

# コマンドライン引数に"posts"が与えられていなければroom_idsを表示
if ! arg_posts
    puts room_ids
end

# コマンドライン引数に"rooms"が与えられていなければ投稿を表示
if ! arg_rooms
    if ! arg_posts
        $room_id = room_ids["roomIds"][0]# 部屋IDが与えられていない場合、room-1についての投稿を取得
    end
    response = Faraday.get("https://next-chat-kohl.vercel.app/api/posts", room_id: $room_id)
    posts = JSON.parse(response.body)
    puts posts
end