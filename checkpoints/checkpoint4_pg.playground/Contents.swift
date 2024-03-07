import Cocoa

enum NumberErrors: Error {
    case outOfBounds, noRoot
}

func nonBuiltInSqrt(number: Int) throws -> Int {
    if (number < 1) || (number > 10_000) { throw NumberErrors.outOfBounds}
    
    var root: Int?
    
    for i in 1...100 {
        if i * i == number {
            root = i
        }
    }
    
    if root == nil {
        throw NumberErrors.noRoot
    } else {
        return root!
    }
}

do {
    let squareRoot = try nonBuiltInSqrt(number: 50)
    print("The square root is \(squareRoot).")
} catch NumberErrors.outOfBounds {
    print("Number is out of bounds.")
} catch NumberErrors.noRoot {
    print("Number has no square root.")
} catch {
    print("There was an error: \(error.localizedDescription).")
}
