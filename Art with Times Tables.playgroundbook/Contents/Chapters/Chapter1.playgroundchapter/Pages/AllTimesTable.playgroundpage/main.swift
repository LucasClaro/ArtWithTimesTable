//#-hidden-code
import PlaygroundSupport
import TimesTableModule

//#-end-hidden-code
/*:
 That lovely heart like shape is called Cardioid. It is a very usual shape in Math.
 
 Try to combine different values for **timesTable** and **numberOfDots** variables and see what patterns will come out.
*/

//#-code-completion(everything, hide)
//#-code-completion(identifier, show, false, true)
var showNumbers : Bool = /*#-editable-code*/false/*#-end-editable-code*/
//#-code-completion(everything, hide)
var timesTable : Int = /*#-editable-code*/3/*#-end-editable-code*/
var numberOfDots : Int = /*#-editable-code*/100/*#-end-editable-code*/

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
