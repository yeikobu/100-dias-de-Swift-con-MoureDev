//: [Previous](@previous)

import Foundation

func splitOnNewlines(_ poem: String) -> [String]  {
    return poem.components(separatedBy: "\n")
}

splitOnNewlines("Winken.\nBlinken\n\nAnd Nod.")

func firstLetter(_ line: String) -> Character {
    let firstChar = line.first!
    
    return firstChar
}

print(firstLetter("Hola"))


func backDoorPassword(_ phrase: String) -> String {
    return "\(phrase), please"
}

backDoorPassword("horse")

func ithLetter(_ line: String, i: Int) -> Character {
    let index = line.index(line.startIndex, offsetBy: i)
    return line[index]
}

ithLetter("Impatiently waits for", i: 2)

func secretRoomPassword(_ phrase: String) -> String {
    phrase.uppercased()
}
