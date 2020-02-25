//
//  main.swift
//  a_swift_tour
//
//  Created by Sem Spanhaak on 25/02/2020.
//  Copyright © 2020 Sem Spanhaak. All rights reserved.
//

// Main credits are going to:
// https://docs.swift.org/swift-book/GuidedTour/GuidedTour.html
// Following; the code used in the examples

// Simple Values
let newfloat: Float = 4;

print(newfloat)

let label = "The width is "
let width = 94
let widthLabel = label + String(width)

print(widthLabel)

let apples = 3
let oranges = 5
let appleSumary = "I have \(apples) apples."
let fruitSumary = "I have \(apples + oranges) pieces of fruit."

print(fruitSumary)


let quotation = """
I said "I have \(apples) apples."
And then I said "I have \(apples + oranges) pieces of fruit."
"""

// Normal array
var shoppingList = ["fish", "water", "tulips"]
shoppingList[1] = "bottle of watter"

// Accoisiative array
var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic",
]
occupations["Jayne"] = "Public Relations"

// Adding to arrrays
shoppingList.append("blue paint")
print(shoppingList)

// Empty array
let emptyArray = [String]()
let emptyDictionary = [String: Float]()

// Control Flow

let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0

for score in individualScores {
    if score > 50 {
        teamScore+=3
    } else {
        teamScore+=1
    }
}
print(teamScore)
// Prints "false"

var optionalString: String? = "Hello"
print(optionalString == nil)
// Prints "false"

// Nilable variable
var optionalName: String? = nil

var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
} else {
    greeting = "Hello? Do I know you?"
}

print(greeting)

// Optional with fallback to other var
let nickName: String? = nil // <-- Must be nillable
let fullName: String = "John Appleseed"
let informalGreeting = "Hi \(nickName ?? fullName)"

print(informalGreeting)

// Switch statement in Swift
// No brakes are needed
let vegetable = "red pepper"

switch vegetable {
    case "celery":
        print("Add some raisins and make ants on a log.")
    case "cucumber", "watercress":
        print("That would make a good tea sandwich.")
    case let x where x.hasSuffix("pepper"):
        print("Is it a spicy \(x)?")
    default:
        print("Everything tastes good in soup.")
}
// Prints "Is it a spicy red pepper?"

// for-in iteration
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]

var largest = 0
var largestNumbers = [Int]()
for (_, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
            largestNumbers.append(number)
        }
    }
}
print("Previous largest before: \(largestNumbers)")
print(largest)
// Prints "25"

// While loop in Swift
var n = 2
while n < 100 {
    n *= 2
}
print(n)

// Same as the above
var m = 2
repeat {
    m *= 2
} while m < 100
print(m)

// Indexing a loop
// Getting and holding a index with a for loop

// Count from 0 to 4. Without 4
var total = 0
for i in 0..<4 {
    total+=i
}
print(total)

// Count from 0 to 4. With 4 included
var intArray = [Int]()
for j in 0...4 {
    intArray.append(j)
}
print(intArray)

// Functions in Swift

// function with label
// this is more clear
func greet(person: String, day: String) -> String {
    return "Hello \(person), today is \(day)!"
}
print(greet(person: "Sem", day: "a nice day"))

// function without label
// this is less clear but more common in other languages
func greet(_ person: String, on day: String) -> String {
    return "Hello \(person), today is \(day)."
}
print(greet("John", on: "Wednesday"))

func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0

    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }

    return (min, max, sum)
}
let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
// Can be accessed by name of variable
print(statistics.sum)
// Prints "120"

// Accessed by number (starting at the count of 0)
print(statistics.2)
// Prints "120"


// Nesting function in Swift
func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
// Print 15
print(returnFifteen())

// Function returning a function in Swift.
// NOTE: ((Int)) stands for returning a func that returns a Int
func makeIncrenter() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return number + 1
    }
    return addOne // No parentheses
}

// Creating a funtion pointer
var increment = makeIncrenter()
print("The increment of 7 is: \(increment(7))")

func hasMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
func overTen(number: Int) -> Bool {
    return number >= 10
}
var numbers = [20, 19, 11, 12]
print(hasMatches(list: numbers, condition: lessThanTen))

let mappedNumbersTimesThree0 = numbers.map({ (number: Int) -> Int in
    let result = 3 * number
    return result
})

let mappedNumbersTimesThree1 = numbers.map({ number in 3 * number })

//EXPERIMENT
//Rewrite the closure to return zero for all odd numbers.
let mappedNumbersReturnZero = numbers.map({ (number: Int) -> Int in
    if number % 2 != 0 {
        return 0
    }
    return number
})

print("Map0: \(mappedNumbersTimesThree0) \nMap1: \(mappedNumbersTimesThree1) \nMapZero: \(mappedNumbersReturnZero)")

let numbersLtoS = numbers.sorted { $0 > $1 }
let numbersStoL = numbers.sorted { $0 < $1 }

print(numbersLtoS)
print(numbersStoL)

// Objects and Classes

var shape = Shape(name: "Shape")
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()
print(shapeDescription)

let sq = Square(sideLength: 5.2, name: "my test square")
print(sq.area())
print(sq.simpleDescription())

let circle = Circle(radius: 2, name: "Circle")
print(circle.area())

var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
// Prints "9.3"
triangle.perimeter = 9.9
print(triangle.sideLength)
// Prints "3.3000000000000003"

var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
// Prints "10.0"
print(triangleAndSquare.triangle.sideLength)
// Prints "10.0"
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
print(triangleAndSquare.triangle.sideLength)
// Prints "50.0"

// Enumerations and Structures

enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king

    func simpleDescription() -> String {
        switch self {
            case .ace:
                return "ace"
            case .jack:
                return "jack"
            case .queen:
                return "queen"
            case .king:
                return "king"
            default:
                return String(self.rawValue)
        }
    }
}

let ace = Rank.ace
let aceRawValue = ace.rawValue

func compareRanks(rank1: Rank, rank2: Rank) -> Bool {
    if rank1.rawValue == rank2.rawValue {
        return true;
    }
    return false;
}

if let convertedRank = Rank(rawValue: 3) {
    let threeDescription = convertedRank.simpleDescription()
    print(threeDescription)
}

enum Suit {
    case spades, hearts, diamonds, clubs

    func simpleDescription() -> String {
        switch self {
            case .spades:
                return "spades"
            case .hearts:
                return "hearts"
            case .diamonds:
                return "diamonds"
            case .clubs:
                return "clubs"
        }
    }
    
    func color() -> String {
        switch self {
        case .spades,.clubs:
            return "black"
        case .hearts,.diamonds:
            return "red"
        }
    }
}
let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()


enum ServerResponse {
    case result(String, String)
    case failure(String)
    case lighting(Int)
}

let success = ServerResponse.result("6:00 am", "8:09 pm")
let failure = ServerResponse.failure("Out of cheese.")
let lighting = ServerResponse.lighting(10)

// Change 'success' to 'failure' and the print will change
switch lighting {
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
case let .failure(message):
    print("Failure...  \(message)")
case let .lighting(sound):
    print("LIGHTNING!!! \(sound) times!")
}

struct Card {
    var rank: Rank
    var suit: Suit
    
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
    
    // EXPERIMENT
    // Write a function that returns an array containing a full deck of cards, with one card of each combination of rank and suit.
    // source: https://stackoverflow.com/questions/24109691/add-a-method-to-card-that-creates-a-full-deck-of-cards-with-one-card-of-each-co
    func createDeck() -> [Card] {
        let ranks = [Rank.ace, Rank.two, Rank.three, Rank.four, Rank.five, Rank.six, Rank.seven, Rank.eight, Rank.nine, Rank.ten, Rank.jack, Rank.queen, Rank.king]
        let suits = [Suit.spades, Suit.hearts, Suit.diamonds, Suit.clubs]
        var deck = [Card]()
        
        for suit in suits {
            for rank in ranks {
                deck.append(Card(rank: rank, suit: suit))
            }
        }
        return deck
    }
}

let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()

//
// Protocols and Extensions
//
// Summary:
//  Maybe just some interfaces from other planets 🪐
//

protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += "  Now 100% adjusted."
    }
}

var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription


extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}
print(7.simpleDescription)

let protocolValue: ExampleProtocol = a
print(protocolValue.simpleDescription)
// Prints "A very simple class.  Now 100% adjusted."
// print(protocolValue.anotherProperty)  // Uncomment to see the error

//
// Error Handling
//
// Summary:
//
//

enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}

func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    }
    return "Job sent"
}

do {
    let printerResponse = try send(job: 1040, toPrinter: "Never Has Toner")
    print(printerResponse)
} catch {
    print(error)
}

do {
    let printerResponse = try send(job: 1440, toPrinter: "Gutenberg")
    print(printerResponse)
} catch PrinterError.onFire {
    // Only when printer is onFire
    print("I'll just put this over here, with the rest of the fire.")
} catch let printerError as PrinterError {
    // Only Error where type is PrinterError
    print("Printer error: \(printerError).")
} catch {
    // Completely different error than PrinterError
    print(error)
}

let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")
let printerFailure = try? send(job: 1885, toPrinter: "Never Has Toner")
print(printerSuccess ?? "Still nothing?")
print(printerFailure ?? "Nada")

var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]

func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
    }

    let result = fridgeContent.contains(food)
    return result
}
fridgeContains("banana")
print(fridgeIsOpen)

//
// Generics
//
// Summary:
//  Exactly like C#
//

func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var result = [Item]()
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}
// ["knock", "knock", "knock", "knock"]
print(makeArray(repeating: "knock", numberOfTimes: 4))


// Reimplement the Swift standard library's optional type
enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}
var possibleInteger: OptionalValue<Int> = .none
possibleInteger = .some(100)


func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
    where T.Element: Equatable, T.Element == U.Element
{
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    return false
}
anyCommonElements([1, 2, 3], [3])
