import Cocoa

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

func filterLuckyNumbers(numbers: [Int], filter: ([Int]) -> [Int], mapper: ([Int]) -> [String]) {
    var filteredNumbers = filter(numbers)
    filteredNumbers = filteredNumbers.sorted()
    let mappedNumbers = mapper(filteredNumbers)
    for i in 0..<mappedNumbers.count{
        print(mappedNumbers[i])
    }
}

filterLuckyNumbers(numbers: luckyNumbers) { array in
    array.filter { $0.isMultiple(of: 2) == false }
} mapper: { array in
    array.map { "\($0) is a lucky number" }
}
