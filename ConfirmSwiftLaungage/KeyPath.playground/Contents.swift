import UIKit
import SwiftUI

struct Dog {
    var name: String
    var age: Int
}

var dog = Dog(name: "わん", age: 12)
print(dog)

/*
 AnyKeyPath
 -> オプショナルで返ってくる
 */
let nameKeyPath: AnyKeyPath = \Dog.name
print(dog[keyPath: nameKeyPath])

/*
 PartialKeyPath
 -> GenericsでRootの型を指定する
 */
let partialKeyPath: PartialKeyPath<Dog> = \.name
print(dog[keyPath: partialKeyPath])

/*
 keyPath
 -> GenericsでRootとValueの型を指定できる(\.ageを選択するとコンパイルエラー)
 ※Key path value type 'Int' cannot be converted to contextual type 'String'
 */
let keyPath: KeyPath<Dog, String> = \.name
print(dog[keyPath: keyPath])

/*
 WritableKeyPath
 -> keypathでアクセスしたプロパティの値を変更できる
 */

let writableKeyPath: WritableKeyPath<Dog, String> = \.name
dog[keyPath: writableKeyPath] = "にゃー"
print(dog[keyPath: writableKeyPath ])

/*
PreferenceWritableKeyPath
 -> 参照型(class, actor)の場合に使用する
 */

class DogClass {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let referenceKeyPath: ReferenceWritableKeyPath<DogClass, String> = \.name
let dogClass = DogClass(name: "wan", age: 2)
dogClass[keyPath: referenceKeyPath] = "にゃー"
print(dogClass[keyPath: referenceKeyPath])

/*
 Dynamic Member Lookup
  存在しないプロパティにsubscriptを通してアクセスすることができる
◎特徴
 - サジェストは出ない
 - オプショナルを扱う(戻り値をオプショナルな型にするかそれとも??で回避するか)
 */
@dynamicMemberLookup
struct Animal {
    private let animalNames = ["cat": "まる", "dog": "ぽち"]
    subscript(dynamicMember key: String) -> String? {
        animalNames[key]
    }
    
}

let animal = Animal()
print(animal.cat)

/*
 KeyPath Member Lookup
 - dynamicMemberLookupを使って行う
 特徴
 - サジェストが出る
 - ルートの型指定ができる
 */

@dynamicMemberLookup
struct AnimalKeyPathLookup<T> {
    private let animal: T
    
    init(animal: T) {
        self.animal = animal
    }
    
    subscript<U>(dynamicMember keypath: KeyPath<T, U>) -> U {
        animal[keyPath: keypath]
    }
}

struct Cat {
    let name: String
    init(name: String) {
        self.name = name
    }
}
let cat = Cat(name: "わー")
let animalKeypath = AnimalKeyPathLookup(animal: cat)
print(animalKeypath.name)


