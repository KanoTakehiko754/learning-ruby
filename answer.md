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