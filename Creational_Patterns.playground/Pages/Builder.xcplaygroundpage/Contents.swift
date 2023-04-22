//: [Previous](@previous)
/*:
 
 The intent of the Builder design pattern is to separate the construction of a complex object from its representation.
  ![builder](builder.png)
 
 
 See more:
 [A good explanation](https://medium.com/swift2go/builder-pattern-in-swift-for-beginners-79415d30872e)
 
 
 */

func createBuilder(configuration: [String: String]) -> LaptopBuilder? {
    guard let model = configuration["base_model"] else {
        return nil
    }
        
    var laptopBuilder: LaptopBuilder?
    switch model {
    case "budget":
        laptopBuilder = BudgetLaptopBuilder()
    case "office":
        laptopBuilder = OfficeLaptopBuilder()
    case "high-end":
        laptopBuilder = HighEndLaptopBuilder()
    default:
        print("Unexpected value.")
    }
    
    return laptopBuilder
}

var configuration = ["base_model": "budget"]
var laptopBuilder = createBuilder(configuration: configuration)
var director = Director(builder: laptopBuilder)
director.constructLaptop(configuration: configuration)

if let laptop = laptopBuilder?.getLaptop() {
    print(laptop)
}

configuration = ["base_model": "office",
                 "size": "13-inch"]
laptopBuilder = createBuilder(configuration: configuration)
director = Director(builder: laptopBuilder)
director.constructLaptop(configuration: configuration)

if let laptop = laptopBuilder?.getLaptop() {
    print(laptop)
}

configuration = ["base_model": "high-end",
                 "size": "13-inch",
                 "graphics": "intel-iris-plus-graphics-645"]
laptopBuilder = createBuilder(configuration: configuration)
director = Director(builder: laptopBuilder)
director.constructLaptop(configuration: configuration)

if let laptop = laptopBuilder?.getLaptop() {
    print(laptop)
}

//: [Next](@next)
