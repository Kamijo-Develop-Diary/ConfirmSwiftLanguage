import UIKit
/*
 特徴
 - enumのcaseはプロトコルで定義することができる
    - staticなプロパティ メソッドにしないといけなさそう？？
 */

protocol EnumProtocol {
    static var foo: Self { get }
    static func hoge(arg: Int) -> Self
    static func fuga(arg1: Int, arg2: String) -> Self
}

enum Hoge: EnumProtocol {
case foo
case hoge(arg: Int)
case fuga(arg1: Int, arg2: String)
}

var hoge1: Hoge = .foo
var hoge2: Hoge = .fuga(arg1: 1, arg2: "1")
print(hoge1)
print(hoge2)

/*
 特徴
 - enumのcaseをクロージャーで表すことができる
 
 ポイント
    - associated valueを使っているcaseのみ
 */

enum Test1 {
    case action1(String)
    case action2(Int)
}

enum Test2 {
    case action1(String)
    case action2(Int)
}

func testFunction1(
    embed: @escaping (String) -> Test1
) {
    print(embed)
}

func testFunction2<Value>(
    embed: @escaping (Value) -> Test1
) {
    print(embed)
}

func testFunction3<Value, Root>(
    embed: @escaping (Value) -> Root
) {
    print(embed)
}

testFunction1(embed: Test1.action1)
//testFunction1(embed: Test.action2) <- compile error
testFunction2(embed: Test1.action2)
//testFunction2(embed: Test2.action1) <- compile error
testFunction3(embed: Test1.action1)
testFunction3(embed: Test2.action1)

enum HogeAction {
    case action1
    case action2(id: String)
}

