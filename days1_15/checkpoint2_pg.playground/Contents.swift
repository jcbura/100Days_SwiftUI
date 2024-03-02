import Cocoa

let strings = ["This", " is", " an", " array", " of", " strings!", " strings!"]
print("Total number of items is: \(strings.count).")

var setOfStrings = Set(strings)
print("Total number of unique items is: \(setOfStrings.count).")

