import Cocoa

func randomInteger(array: [Int]?) -> Int { array?.randomElement() ?? Int.random(in: 1...100) }

let array: [Int]? = nil
print(randomInteger(array: array))
