//: [Previous](@previous)
/*:
 
 The purpose of the abstract factory is to provide an abstraction for creating families of related or dependent objects. The calling component doesn't know the concrete types involved in the creation process. Callers should only interact with protocols or base classes to instantiate and use the families of objects. The following class diagram provides an overview of the abstract factory design pattern.
 
   ![Abstract Factory](abstractFactory.png)
 
 The abstract factory defines the operations that create abstract products. The concrete factory types implement the interface declared by the abstract factory. We have an abstract product for each family of products. The concrete products implement the abstract product interfaces. In Swift, the abstract factory and the abstract product types should be protocols or base classes. Here's a real-world example of the abstract factory. The client deals exclusively with the computer factory and the three abstract products. The calling component doesn't interact with the concrete factories or any of the products directly, thus, we can change these implementation types without affecting the components that use them.
 
 This pattern is similar to the factory method, but you should use the abstract factory to obtain a set of related objects instead of just one.
 
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
