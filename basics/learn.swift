// credit to https://learnxinyminutes.com/swift/
import Foundation

print("Hello, world")

let theAnswer = 42
var theQuestion = "What is the meaning of life."
print(theQuestion)
print(theAnswer)

theQuestion = "What is existensialism?"

let someConstant: Int
var someVariable: String

someConstant = 0
someVariable = "00"
print(someConstant)
print(someVariable)

let aString: String = "A stirng"
let aDouble: Double = 0.0

let stringWithDouble = aString + String(aDouble)
let intFromDouble = Int(aDouble)

let descriptionString = "The value of aDouble is \(aDouble)"
let equation = "Six by nine is \(6 * 9), not 42."
let explanationString = #"The string I used was "The value of aDouble is \(aDouble)" and the result was \#(descriptionString)"#

print(explanationString)

let shoppingList = ["catfish", "water", "tulpis",]
let secondElement = shoppingList[1]

var mutableShoppingList = shoppingList
mutableShoppingList[2] = "mango"

print(shoppingList == mutableShoppingList)

var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic"
]
occupations["Jayne"] = "Public Relations"

let immutableOccupations = occupations

print(immutableOccupations == occupations)

mutableShoppingList.append("blue paint")
occupations["Tim"] = "CEO"

mutableShoppingList = []
occupations = [:]

let emptyArray = [String]()
let emptyArray2 = Array<String>()

let emptyArray3: [String] = []
let emptyArray4: Array<String> = []

let emptyDic = [String: Double]()
let emptyDic2 = Dictionary<String, Double>()
let emptyMutatbleDic: [String: Double] = [:]
let explicitEmptyMutableDic: Dictionary<String, Double> = [:]

let øπΩ = "value" 
let 🤯 = "wow"

func testGuard() {
    guard let aNumber = Optional<Int>(7) else {
        return 
    }
    print("number is \(aNumber)")
}

var numbers = [1, 2, 6]
numbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    return result
})
numbers = numbers.map({number in 3 * number})
print(numbers)

numbers = numbers.sorted { $0 > $1 }
print(numbers)

