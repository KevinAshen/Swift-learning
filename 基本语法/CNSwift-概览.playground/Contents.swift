import Cocoa

/// 简单值
var str = "Hello, playground"
    
print("Hello, world!")

var myVariable = 42

let myConstant = 42

let explicitDouble: Double = 70

let label = "The Width is "
let width = 94
let widthLabel = label + String(width)

let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples"
let fruitSummary = "I have \(apples + oranges) pieces of fruit"

let quotation = """
I said "I have \(apples) apples"
And then I said "I have \(apples + oranges) pieces of fruit."
"""

var shoppingList = ["catfish", "water", "tulips", "blue paint"]
shoppingList[1] = "bottle of water"

var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic",
]
occupations["Jayne"] = "Public Relations"

let emptyArray = [String]()
let emptyDictionary = [String: Float]()

shoppingList = []
occupations = [:]

/// 控制流
//在一个 if语句当中，条件必须是布尔表达式——这意味着比如说 if score {...}将会报错，不再隐式地与零做计算了
let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)

// FIXME:这里的备用值是在干嘛？
var optionalString: String? = "Hello"
print(optionalString == nil)

var optionName: String? = nil
var greeting = "Hello!"
if let name = optionName {
    greeting = "Hello, \(name)"
} else {
    greeting = "Thank"
}

let nickName: String? = nil
let fullName: String = "John Appleseed"
let informalGreeting = "Hi \(nickName ?? fullName)"

let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"):
    print("It is a spicy \(x)?")
default:
    print("Everything tastes good in soup.")
}

let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
var largestkindStr = "123"
for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
            largestkindStr = kind
        }
    }
}
print(largest)
print(largestkindStr)

var total = 0
for i in 0...4 {
    total += i
}
print(total)

/// 函数和闭包
func greet(person: String, day: String) -> String {
    return "Hello \(person), today is \(day)."
}
greet(person: "Bob", day: "Tuesday")

func greet(_ person: String, on day: String) -> String {
    return "Hello \(person), today is \(day)."
}
greet("John", on: "Wednesday")

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
print(statistics.sum)
print(statistics.2)

func sumOf(numbers: Int...) -> Int {
    var sum = 0;
    for number in numbers {
        sum += number
    }
    return sum
}
//sumOf()
//sumOf(numbers: 42, 597, 12)

func averageaOf(numbers: Double...) -> Double {
    var res: Double = 0;
    var count: Double = 0;
    for number in numbers {
        res += number
        count += 1
    }
    res /= count
    return res
}
averageaOf(numbers: 1, 3, 6, 7, 10)

func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFifteen()

func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(7)

func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    print(number)
    return number < 10
}
var numbers = [20, 19, 7, 12]
hasAnyMatches(list: numbers, condition: lessThanTen)

//numbers.map({
//    (number: Int) -> Int in
//    let result = 3 * number
//    print(result)
//    return result
//})

numbers.map({
    (number: Int) -> Bool in
    if number % 2 == 0 {
        return false
    } else {
        return true
    }
})

let mappedNumbers = numbers.map({
    number in 3 * number
})
print(mappedNumbers)

let sortedNumbers = numbers.sorted{
    $0 > $1
}
print(sortedNumbers)

/// 对象和类
class Shape {
    var numberOfSides = 0
    let age = 18
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
    func getNum(num: Int) -> Void {
        print("A shape with \(num) sides.")
    }
}

var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()

class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}
let test = Square(sideLength: 5.2, name: "my test square")
test.area()
test.simpleDescription()

class Circle: NamedShape {
    var radiusLength: Double
    let PI = 3.1415926
    
    init(radiusLength: Double, name: String) {
        self.radiusLength = radiusLength
        super.init(name: name)
    }
    
    func area() -> Double {
        return PI * radiusLength * radiusLength
    }
    
    override func simpleDescription() -> String {
         return "A square with sides of length \(radiusLength)."
    }
}

let testCircle = Circle(radiusLength: 5.2, name: "my test circle")
testCircle.area()
testCircle.simpleDescription()

class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}
var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLength)

class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
print(triangleAndSquare.triangle.sideLength)

//let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let optionalSquare: Square? = nil
let sideLength = optionalSquare?.sideLength

/// 枚举和结构体
enum Rank: Int {
    case ace = 1
    case two, three, four, five, seven, eight, nine, ten
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
                
        }
    }
}
