/*:
 
 # Prototype
 
 The prototype works by cloning an existing prototype object. We instantiate the prototype instance as usual; however, all consecutive instances get created by copying this prototype. As a result, we get rid of the repeated expansive initialization code for all successive object creations. We rely on cloning, which is more efficient. 
 
 */
import UIKit

var greeting = "Hello, playground"
