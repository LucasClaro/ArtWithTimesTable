//#-hidden-code
import PlaygroundSupport
import TimesTableModule

//#-end-hidden-code
/*:
 One last curious thing to see is what lies between two natural times tables.
 
 When running the code now you will see the times table from 2 to infinity increasing by 0.1.
 
 You can change the value of **animationStyle** from *toInfinity* to *LineByLine* or *NoAnimation*
 
 And choose one of these colors for the variable **favoriteColor**: *red*, *orange*, *yellow*, *green*, *cyan*, *blue* and *purple*
*/

//#-code-completion(everything, hide)
//#-code-completion(identifier, show, false, true)
var showNumbers : Bool = /*#-editable-code*/false/*#-end-editable-code*/
//#-code-completion(everything, hide)
var timesTable : Double = /*#-editable-code*/2.0/*#-end-editable-code*/
var numberOfDots : Int = /*#-editable-code*/100/*#-end-editable-code*/
var animationStyle : String = /*#-editable-code*/"toInfinity"/*#-end-editable-code*/
var favoriteColor : String = /*#-editable-code*/"orange"/*#-end-editable-code*/

//#-hidden-code

public func startSystem(){
    guard let remoteView = PlaygroundPage.current.liveView as? PlaygroundRemoteLiveViewProxy else { fatalError("Live View not configured in this page's LiveView.swift") }
    
    remoteView.send(.boolean(showNumbers))
    remoteView.send(.floatingPoint(timesTable))
    remoteView.send(.integer(numberOfDots))
    remoteView.send(.string(favoriteColor))
    remoteView.send(.string(animationStyle))
}

startSystem()
//#-end-hidden-code

//: Thank you for staying till here. I hope you have enjoyed!
