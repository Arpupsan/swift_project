var array: [Double] = [1,2,3]
//array.append(4)
//var array = ["Artur", "Kolya", "Nastya"]
//print(array.min())

protocol Human {
    var name: String { get }
    func sayHello()
}

struct Person : Human {
    let name: String
    func sayHello() {
        print("My name is \(name)")
    }
}

extension Person: Comparable {
    static func < (lhs: Person, rhs: Person) -> Bool {
        lhs.name < rhs.name
    }
}

extension Person: Equatable {

    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.name.uppercased() == rhs.name.uppercased()
//      &&  lhs.age == rhs.age
    }

//    static func < (lhs: Person, rhs: Person) -> Bool {
//        lhs.name < rhs.name
//    }
}




var array2 : [Person] = [.init(name:"Kolya"), .init(name:"Arthur")]
print(array2.min())

//add element
array2.append(.init(name:"Vasya"))
//add more then 1 element
array2.append(contentsOf: [Person(name:"Vasyy"), Person(name:"Roma")])
//count how many elemens in array
array2.count
//check if array empty
array.isEmpty

array.first
array.last
array[2]
//need Equatable
array2.contains(Person(name:"Vasya"))
//...


var array3 = array2

array.removeLast()
print(array2.count)
print(array3.count)


//print(array[1])
//print(array[1...3])
//print(array[1..<3])
//print(array[1...])
//print(array[...3])
//print(array[..<3])
//print(array[...])



//Dictionary

var dictionary: [String: Int] = [
    "Arthur":24,
    "Kolya" :23,
    "Yana" : 22,
    "Nastya": 12
]

dictionary["Vasya"] = 27
print(dictionary)

//remove value from dictioanry
dictionary["Kolya"] = nil
print(dictionary)
dictionary.removeValue(forKey: "Yana")
print(dictionary)

print(dictionary["Arthur"])

if let age = dictionary["Arthur"] {
    print("Arthur age is \(age)")
} else {
    print ("Maaan no such age")
}


struct Info{
    let adress: String
    let age : Int
}

extension Person: Hashable{
    
}

var InfoBook: [Person: Info] = [
    .init(name: "Kolya"): .init(adress: "Poland", age: 23),
    .init(name: "Arthur"): .init(adress: "Ukraine", age: 24)
]

print(InfoBook[.init(name:"Arthur")])


var set: Set<Int> = [1,2,3]
set.insert(3)
print(set)

print(Set(Array("Arthur")).count)


let numbers1 = [1,2,3,4,5]
let numbers2 = [4,5,6,7]

let set1 = Set(numbers1)
let set2 = Set(numbers2)

//пересечения
print(set1.intersection(set2))
//union add element set1 and set2
print(set1.union(set2))
//или только в сет1 или только в сет2
print(set1.symmetricDifference(set2))

//относительно другого сета - униальные значения
print(set1.subtracting(set2))
print(set2.subtracting(set1))


for number in numbers1 {
    print(number)
}

numbers1.forEach{
    print($0)
}

numbers1.forEach{ n in
    print(n)
}

for keyValue in InfoBook {
    print (keyValue.key)
    print (keyValue.value.adress)
    print (keyValue.value.age)
    print ()
}

for (key, value) in InfoBook {
    print(key)
    print(value.adress)
    print(value.age)
    print()
}

InfoBook.forEach{
    print($0.key)
    print($0.value.adress)
    print($0.value.age)
    print()
}

InfoBook.forEach{ key, value in
    print(key)
    print(value.adress)
    print(value.age)
    print()
}


// map, filter m reduce
// map: [] -> []

let start = [1,2,3]
let result = start.map {$0*3}

let result1 = result.map {String($0) + "_result"}

let ages = InfoBook.map {_,value in value.age}
print(ages)

// filter
let oddNum = numbers1.filter {$0 % 2 == 1}
print(oddNum)

print(InfoBook .filter {key,value in key.name.contains("r") || value.age<24}
    .map {key, _ in key.name}
)

print(InfoBook .filter {key,value in key.name.contains("r") || value.age<24}
)

// reduce: [] -> .

let sum = numbers1.reduce(0) {prev , element in
    prev + element
}

let q = InfoBook.reduce((0, "")) {prev, element in
    (prev.0 + element.value.age, prev.1 + element.key.name + " ")
}

print(q)

let sum1 = numbers1.reduce(0,+)
print(sum1)
