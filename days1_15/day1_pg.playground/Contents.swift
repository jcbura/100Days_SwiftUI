import Cocoa

// How to create variables and constants

var greeting = "Hello, playground"

var name = "Ted"
name = "Rebecca"
name = "Keeley"

let character = "Daphne"

var playerName = "Roy"
print(playerName)

playerName = "Dani"
print(playerName)

playerName = "Sam"
print(playerName)

let managerName = "Michael Scott"
let dogBreed = "Samoyed"
let meaningOfLife = "How many roads must a man look down?"

// How to create strings

let actor = "Denzel Washington"
let filename = "paris.jpg"
let result = "⭐️ You win! ⭐️"

let quote = "Then he tapped a sign saying \"Believe\" and walked away."

let movie = """
A day in
the life of an
Apple engineer
"""

let nameLength = actor.count
print(nameLength)

print(result.uppercased())

print(movie.hasPrefix("A day"))
print(filename.hasSuffix(".jpg"))

// How to store whole numbers

let score = 10
let reallyBig = 100_000_000

let lowerScore = score - 2
let higherScore = score + 10
let doubledScore = score * 2
let squaredScore = score * score
let halvedScore = score / 2

var counter = 10
counter += 5
print(counter)

counter *= 2
counter -= 10
counter /= 2

let wholeNumber = 120
print(wholeNumber.isMultiple(of: 3))
print(120.isMultiple(of: 3))

// How to store decimal numbers

let decimalNumber = 0.1 + 0.2
print(decimalNumber)

let a = 1
let b = 2.0
let c = Double(a) + b

let double1 = 3.1
let double2 = 3131.3131
let double3 = 3.0
let int1 = 3

var rating = 5.0
rating *= 2
