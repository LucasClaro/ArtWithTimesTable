//#-hidden-code
import PlaygroundSupport
import TimesTableModule

//#-end-hidden-code
/*:
 Now let's apply the 2 times table inside our circle.
 
 1 x 2 = 2. So we will draw a line between points 1 and 2.
 
 2 x 2 = 4. So the line will go from 2 to 4.
 
 ...
 
 5 x 2 = 10. Now, our line will go from 5 to 0 which is also 10.
 
 6 x 2 = 12. Line from 0 to 2 which is also a 12.
 
 And so on.
 
 Run the code to see the result.
*/

//#-code-completion(everything, hide)
//#-code-completion(identifier, show, false, true)
var showNumbers : Bool = /*#-editable-code*/true/*#-end-editable-code*/
var timesTable : Int = 2
//#-code-completion(everything, hide)
var numberOfDots : Int = /*#-editable-code*/10/*#-end-editable-code*/

//#-hidden-code

var animationStyle : String = "LineByLine"

public func startSystem(){
    guard let remoteView = PlaygroundPage.current.liveView as? PlaygroundRemoteLiveViewProxy else { fatalError("Live View not configured in this page's LiveView.swift") }
    
    remoteView.send(.boolean(showNumbers))
    remoteView.send(.floatingPoint(Double(timesTable)))
    remoteView.send(.integer(numberOfDots))
    remoteView.send(.string(animationStyle))
}

startSystem()
//#-end-hidden-code
//: Try to increase the number of points to one hundred by changing the value of variable **numberOfDots** and see what happens.
