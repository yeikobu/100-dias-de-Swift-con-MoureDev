//: [Previous](@previous)

import Foundation

func twoFer(name: String = "you") -> String {
    "One for \(name), one for me."
}

print(twoFer())


func reverseString(_ input : String) -> String {
    // Write your code for the 'Reverse String' exercise in this file.
    String(input.reversed())
}

print(reverseString("stressed"))



extension Array {
    func accumulate<T>(_ fun: (Element) -> T) -> [T] {
        var res: [T] = []
        
        for item in self {
            res.append(fun(item))
        }
    
        return res
    }
}
