52. 実行しました。

53. Rubyにおいて**オブジェクト**とは、プログラムの中で扱う「もの」であり、**クラス**とはオブジェクトを作るための「設計図」である。クラスにはメソッドを定義できる。

54.
```
class Dog
    def initialize(name)
        @name = name
    end

    def name
        return @name
    end

    def bark
        puts "Bow! Wow!"
    end
end
```

55. **インスタンス変数**とは、インスタンス(オブジェクト)の中でのみ扱える変数であり、メソッド内で`@hoge`と記述することにより参照できる。

56. **インスタンス変数**はインスタンスの中で扱える変数であるのに対し、**ローカル変数**は定義した最も内側のブロックの中でのみ扱える変数。下の例ではageはインスタンス変数なので、そのインスタンスのどのメソッドからでも参照できるのに対し、nameはinitializeメソッドの中のローカル変数なので、nameメソッドからは参照できない。  
```
class Dog
    def initialize(age, name)
        @age = age # インスタンス変数の定義
        name = name # ローカル変数の定義
    end

    def age
        puts @age
    end

    def name
        puts name
    end
end

pochi = Dog.new(5, "pochi")
pochi.age # 5が出力される
pochi.name # エラー
```

57, 58. 
```
class Human
    def initialize(name)
       @name = name
    end
  
    def greet
      puts "こんにちは。私の名前は#{@name}です"
    end

    def name # nameのゲッター
        return @name
    end

    def set_name(name) # nameのセッター
        @name = name
    end

end
```

59. 
```
class Human
    def initialize(name)
       @name = name
    end
  
    def greet
      puts "こんにちは。私の名前は#{@name}です"
    end

    attr_accessor :name

end
```

60. インスタンスメソッドとは、それを定義したクラスのインスタンスからのみ呼び出せるメソッドである。  
```
class Human
    def initialize(name, age)
       @name = name
       @age = age
    end

    def show_profile
        puts "name: #{@name}, age: #{@age}"
    end

end
```

61. イニシャライザとは、インスタンスを作成するときに初期設定として実行するメソッドである。`<クラス名>.new`を実行すると、新しいインスタンスを作成し、イニシャライザを実行した後の値を取得できる。  
```
class Human
    def initialize(name, age)
       @name = name
       @age = age
    end
  
    def greet
      puts "こんにちは。私の名前は#{@name}です"
    end
end
```

62. クラスメソッドとは、クラスオブジェクトから呼び出せるメソッドである。  
```
class Human
    def initialize(name)
       @name = name
    end
  
    def greet
      puts "こんにちは。私の名前は#{@name}です"
    end

    def self.greet
        puts "こんにちは。私はHumanクラスです"
    end

end
```

63. 以下の例でSuperHumanはHumanクラスを継承したクラスであるため、同じ名前のメソッドで上書きしない限りは親クラスのメソッドをそのまま継承している。よって、SuperHumanクラスはgreetメソッドを持っている。  
```
class Human
    def initialize(name)
       @name = name
    end
  
    def greet
      puts "こんにちは。私の名前は#{@name}です"
    end
end

class SuperHuman < Human
end
```

64, 65. `exercise3.rbに記述しました。

66. 実行しました。

67. Base64エンコードとはデータをアルファベット、数字、一部の記号の合計64種類の文字を使ったコードに変換する方式である。例えば電子メールにおいては本来この64文字しか使えないため、それ以外の文字(全角文字など)を送信するためには、Base64エンコードによりデータを変換して送信するなどの工夫が必要がある。  