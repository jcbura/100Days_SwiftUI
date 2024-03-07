import Cocoa

struct Car {
    let model: String
    let seats: Int
    var gear: Int = 1
    
    mutating func shiftUp() -> Bool {
        if gear < 10 {
            gear += 1
            return true
        }
        return false
    }
    
    mutating func shiftDown() -> Bool {
        if gear > 1 {
            gear -= 1
            return true
        }
        return false
    }
}

var tacoma = Car(model: "Tacoma", seats: 5)
gearInfo(tacoma)

var successfullShift = tacoma.shiftUp()
gearInfo(tacoma)

for _ in 3...11 {
    successfullShift = tacoma.shiftUp()
    gearInfo(tacoma)
}

func gearInfo(_ car: Car) {
    if car.gear == 1 {
        print("A \(car.model) has \(car.seats) seats and is currently in \(car.gear)st gear.")
    } else if successfullShift {
        switch car.gear {
        case 2:
            print("A \(car.model) has \(car.seats) seats and is currently in \(car.gear)nd gear.")
        case 3:
            print("A \(car.model) has \(car.seats) seats and is currently in \(car.gear)rd gear.")
        case 4...10:
            print("A \(car.model) has \(car.seats) seats and is currently in \(car.gear)th gear.")
        default:
            // Should never reach default case.
            print("Uh oh, something must've went wrong.")
        }
    } else {
        print("Uh oh, a \(car.model) doesn't have that gear.")
    }
}
