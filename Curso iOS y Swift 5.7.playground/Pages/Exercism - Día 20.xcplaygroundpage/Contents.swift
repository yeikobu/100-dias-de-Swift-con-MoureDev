//: [Previous](@previous)

import Foundation

// TODO: Define the Position struct
struct Position {
    var x = 0
    var y = 0
    
    mutating func moveTo(newX: Int, newY: Int) {
        x = newX
        y = newY
    }
}

// TODO: Define the Size struct
struct Size {
    var width = 80
    var height = 60
    
    mutating func resize(newWidth: Int, newHeight: Int) {
        width = newWidth
        height = newHeight
    }
}

// TODO: Define the Window class
class Window {
    var title: String = "New Window"
    var screenSize: Size = Size(width: 800, height: 600)
    var size: Size = Size()
    var position: Position = Position()
    var contents: String? = nil
    
    func update(title: String) {
        self.title = title
    }
    
    func update(text: String?) {
        self.contents = text
    }
    
    func display() -> String {
        let defaultMsg: String = "[This window intentionally left blank]"
        return "\(title)\nPosition: (\(position.x), \(position.y)), Size: (\(size.width) x \(size.height))\n\(contents ?? defaultMsg)\n"
    }
    
    func resize(to size: Size) {
        self.size.width = min(max(1, size.width), screenSize.width - position.x)
        self.size.height = min(max(1, size.height), screenSize.height - position.y)
    }
    
    func move(to position: Position) {
        self.position.x = min(max(0, position.x), screenSize.width - size.width)
        self.position.y = min(max(0, position.y), screenSize.height - size.height)
    }
}

let mainWindow: Window = {
    let window = Window()
    window.update(title: "Main Window")
    window.update(text: "This is the main window")
    window.resize(to: Size(width: 400, height: 300))
    window.move(to: Position(x: 100, y: 100))
    return window
}()

