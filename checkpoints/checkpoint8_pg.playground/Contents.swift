import Cocoa

protocol Building {
    var rooms: Int { get set }
    var cost: Int { get }
    var realEstateAgent: String { get }
    
    func printSalesSummary() -> Void
}

struct House: Building {
    var rooms: Int
    let cost: Int
    let realEstateAgent: String
    
    init(rooms: Int, cost: Int, realEstateAgent: String) {
        self.rooms = rooms
        self.cost = cost
        self.realEstateAgent = realEstateAgent
    }
    
    func printSalesSummary() {
        print("This house with \(rooms) was purchase for $\(cost) with agent \(realEstateAgent).")
    }
}

struct Office: Building {
    var rooms: Int
    let cost: Int
    let realEstateAgent: String
    
    init(rooms: Int, cost: Int, realEstateAgent: String) {
        self.rooms = rooms
        self.cost = cost
        self.realEstateAgent = realEstateAgent
    }
    
    func printSalesSummary() {
        print("This office with \(rooms) was purchase for $\(cost) with agent \(realEstateAgent).")
    }
}

let house = House(rooms: 5, cost: 1_000_000, realEstateAgent: "John Doe")
house.printSalesSummary()

let office = Office(rooms: 20, cost: 10_000_000, realEstateAgent: "Jane Doe")
office.printSalesSummary()
