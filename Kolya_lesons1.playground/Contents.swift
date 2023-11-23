let a=1
//a=2

var b = 1
b = 2
print(b)

let c: Double = 1

let d: String

if b==2 {
    d = "Hello"
}   else{
    d = "World"
}


let x = 1, y = 2, z = 3

let red, green , blue : Double


print("b euqals ", b)

let answer: String = "b equals \(b)"
print (answer)

let division = 5.0 / Double(b)

var bool: Bool = true

if bool {
    print("bool is true")
}

let htp404Error = (stastus: 404,descriprion: "Not Found")
print(type(of: htp404Error))
print(htp404Error)
print(htp404Error,1)

let array1 = [1,2,3]
let array2 = [1,2,4]

var person = "Kolya"
var person1 = person
person = "Arthur"

class Perosn {
    let name:String
    
    init(name:String){
        self.name = name
    }
}
//
//value
//reference -> Class , Function


enum Ways {
    case north
    case south
    case east
    case west
}

enum Appearance{
    case light, dark
}

let WhereAmI : Ways = .south

switch WhereAmI {
case .north:
    print("I am on north")
case .south:
    print("I am on south")
case .east:
    print("I am on east")
case .west:
    print("I am on west")
//default :
//    print("IDK")
}

enum Result<Value, Error: Swift.Error> {
    case success(Value)
    case error(Error)
}

enum ErrorType: Error{
    case noData
    case wrongPasword
}

let successResult : Result<Int, ErrorType> = .success(1)
let errorResult : Result<Int, ErrorType> = .error(.wrongPasword)

switch errorResult {
case let .success(value):
    print(value)
case let .error(error):
    print("I got an error \(error)")
}
enum Optional<Value> {
    case some(Value)
    case none
}
func findMin(in array:[Int]) -> Optional<Int> {
    if array.isEmpty{
        return .none
    }
    var minValue = Int.max
    
    for element in array{
        minValue = min(minValue,element)
    }
    
    return .some(minValue)
}


print(findMin(in: [2,33,-10,100,505]))
print(findMin(in: []))

func min(in array: [Int]) -> Int? {
    array.min()
}

let result = min(in: [])

if let result{
    print(result)
} else {
    print("Cringe")
}





















