//#-hidden-code
import PlaygroundSupport
import TimesTableModule
//#-end-hidden-code
/*:
 Hello! Today I am going to share with you something really cool that a teacher once showed me.
 
Let's start with a circle. In this circle we are going to distribute 10 points equally spaced.
 
The point 0 can also represent the number 10, point 1 can also represents number 11 and so on.
 
Using a diferent amount of points would change things a bit, but it'd follow the same logic*/
//#-code-completion(everything, hide)
//#-code-completion(identifier, show, false, true)
var showNumbers : Bool = /*#-editable-code*/true/*#-end-editable-code*/
//#-hidden-code
public func startSystem(){
    guard let remoteView = PlaygroundPage.current.liveView as? PlaygroundRemoteLiveViewProxy else { fatalError("Live View not configured in this page's LiveView.swift") }
    
    remoteView.send(.boolean(showNumbers))
}

startSystem()
//#-end-hidden-code
//: You can change the visibility of the numbers by setting the value of the variable **showNumbers** to false
