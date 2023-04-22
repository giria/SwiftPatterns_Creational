//: [Previous](@previous)


/*:
 
 Creational design patterns provide various object creation mechanisms, which increase flexibility and reuse of existing code.
 
 
 # Singleton
 
 The singleton pattern is a software design pattern that restricts the instantiation of a class to one "single" instance. This is useful when exactly one object is needed to coordinate actions across the system.
   
   What problems solves?
 - Ensure that a class only has one instance
 - Easily access the sole instance of a class
 - Control its instantiation
 - Restrict the number of instances
 - Access a global variable
 
 ## Criticism
 Critics consider the singleton to be an anti-pattern as it introduces global state into an application, often unnecessarily. This in turn can place restrictions on any abstraction that uses the singleton, for example by preventing concurrent use of multiple instances. Furthermore, because it is often exposed as a globally visible accessor, its presence complicates dependency analysis by introducing a potential dependency on the singleton in all code it is visible to, thus requiring analysis of implementation details to determine if a dependency actually exists.[

 Singletons also violate the single-responsibility principle, because not only are they responsible for the singleton's normal task, it must also ensure that only one is instantiated; note that this relies on a "classic" singleton definition where it is responsible for enforcing its own uniqueness through, for example, a static getInstance() method.

 Another drawback is that singletons are difficult to test[dubious – discuss] because they carry global state for the duration of the program[dubious – discuss]. Specifically, because unit testing requires loosely coupled classes in order to isolate what's being tested. Additionally, when a certain class interacts with a singleton, that class and the singleton become tightly coupled[dubious – discuss], making it impossible to test the class on its own without also testing the singleton
 
 */

import Foundation

final public class AppSettings {
    private var settings: [String: Any] = [:]
    
    public static let shared = AppSettings()
    
    //private let serialQueue = DispatchQueue(label: "serialQueue")
    private let concurrentQueue = DispatchQueue(label: "concurrentQueue", attributes: .concurrent)
    
    private init() {}
    
    public func set(_ value: Any, forKey key: String) {
        //serialQueue.sync {
        concurrentQueue.async( flags: .barrier ) {
            self.settings[key] = value
        }
    }
    
    public func object(forKey key: String) -> Any? {
        var result: Any?
        //serialQueue.sync {
        concurrentQueue.sync {
            result = settings[key]
        }
        return result
    }
    
    public func reset() {
        settings.removeAll()
    }
}
