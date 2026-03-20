func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}

func greetAgain(person: String) -> String {
    return "Hello again, " + person + "!"
}

print(greet(person: "Anna"))
print(greet(person: "Brian"))

print(greetAgain(person: "Anna"))
print(greetAgain(person: "Brian"))

func sayHelloWorld() -> String {
    return "Hello, world"
}

print(sayHelloWorld())

func greetCheck(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return greetAgain(person: person) 
    } else {
        return greet(person: person)
    }
}

print(greetCheck(person : "Tim", alreadyGreeted: true))

func greetVoid(person: String) {
    print("Hello, \(person)!")
}

greetVoid(person: "Dave")

func printAndCount(string: String) -> Int {
    print(string)
    return string.count
}
func printWithoutCounting(string: String) {
    let _ = printAndCount(string: string)
}
printAndCount(string: "hello, world")
printWithoutCounting(string: "hello, world")

func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
print("min is \(bounds.min) and max is \(bounds.max)")

func minMaxSafety(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil }
    var mn = array[0]
    var mx = array[0]
    for x in array[1..<array.count] {
        if x < mn {
            mn = x
        } else if x < mx {
            mx = x;
        }
    }
    return (mn, mx)
}

if let bound = minMaxSafety(array: [8, -6, 2, 109, 3, 71]) {
    print("min is \(bounds.min) and max is \(bounds.max)")
}

func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for x in numbers {
        total += x
    }
    return total / Double(numbers.count)
}
print(arithmeticMean(1, 2, 3, 4, 5))
print(arithmeticMean(3, 8.25, 18.75))

func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let tmp = a
    a = b
    b = tmp
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("\(someInt), and \(anotherInt)")

func addTwoInts(_ a: Int, _ b: Int) -> Int {
    a + b
}

func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    a * b
}

print(addTwoInts(3, 3))
print(multiplyTwoInts(3, 3))

var mathFunction: (Int, Int) -> Int = addTwoInts

print("Result \(mathFunction(2, 3))")

mathFunction = multiplyTwoInts
print("Result: \(mathFunction(2, 3))")

let anotherMathFunction = addTwoInts

func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}
printMathResult(addTwoInts, 3, 5)

func stepForward(_ input: Int) -> Int {
    return input + 1
}
func stepBackward(_ input: Int) -> Int {
    return input - 1
}

func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    return backward ? stepBackward : stepForward
}

var currentValue = 3
let moveNearToZero = chooseStepFunction(backward: currentValue > 0)

print("Counting to zero:")
while currentValue != 0 {
    print("\(currentValue)...")
    currentValue = moveNearToZero(currentValue)
}
print("zero!")

func chooseStepFunctionNested(backward: Bool) -> (Int) -> Int {
    func stepF(i: Int) -> Int {return i + 1}
    func stepB(i: Int) -> Int {return i-1}
    return backward ? stepB : stepF
}

var vv = -4
let moveNearToZeroNested = chooseStepFunctionNested(backward: vv > 0)
while vv != 0 {
    print("\(vv)...")
    vv = moveNearToZeroNested(vv)
}
print("zero")