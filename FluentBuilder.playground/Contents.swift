import UIKit


@dynamicMemberLookup
struct Person {
    struct Info {
        var name: String
    }
    var info: Info
    var age: Int
    // 2. 把下標 subscript(dynamicMember:) 的參數型別改成 KeyPath
    // 這邊因為要使界面是讀寫皆可，所以使用 WritableKeyPath 通用型別
    // 通用型別 Value 指的則是查詢目標的型別
    subscript<Value>(dynamicMember keyPath: WritableKeyPath<Info, Value>) -> Value {
        get {
            return info[keyPath: keyPath]
        }
        set {
            info[keyPath: keyPath] = newValue
        }
    }
}


var person = Person(info: .init(name: "Jason"), age: 10)
person.age


