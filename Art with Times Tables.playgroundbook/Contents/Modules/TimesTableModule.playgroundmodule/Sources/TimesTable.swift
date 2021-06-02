import SpriteKit
import UIKit
import PlaygroundSupport

open class ArtViewController : UIViewController {
    
    let scene = ArtScene()
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        let view = SKView()
        
        scene.scaleMode = .resizeFill
        view.presentScene(scene)
        self.view = view
    }
    
    open func isPage2or3(){
        scene.showMoreLabels = true
        scene.start()
    }
}

extension ArtViewController : PlaygroundLiveViewMessageHandler {
    public func receive(_ message: PlaygroundValue){
        
        switch message {
        case let .boolean(info):
            scene.showLabels = info
        case let .integer(info):
            scene.numberOfDots = info
        case let .floatingPoint(info):
            scene.multiplication = CGFloat(info)
        case let .string(info):
            switch info {
            case "NoAnimation":
                scene.animationStyle = .noAnimation
            case "LineByLine":
                scene.animationStyle = .lineByLine
            case "toInfinity":
                scene.animationStyle = .multiplicationTransition
            case "red":
                scene.color = SKColor.red
            case "orange":
                scene.color = SKColor.orange
            case "yellow":
                scene.color = SKColor.yellow
            case "green":
                scene.color = SKColor.green
            case "cyan":
                scene.color = SKColor.cyan
            case "blue":
                scene.color = SKColor.blue
            case "purple":
                scene.color = SKColor.purple
            default:
                break
            }
        default:
            break
        }
        
        scene.start()
    }
}

open class ArtScene: SKScene {
    var radius : CGFloat = 200.0
    var numberOfDots = 10
    var multiplication : CGFloat = 1
    
    var showLabels = true
    var showMoreLabels = false
    var animationStyle : AnimationType = .noAnimation
    var animationCount = 1
    var animationTick = 0
    var animationIntervalController = 1
    
    var color = SKColor.orange
    
    open func start(){
        self.removeAllChildren()
        animationCount = 1
        animationTick = 0
        
        mainCircle()
        
        if showLabels {
            drawLabels()
        }
        if showMoreLabels && showLabels{
            drawMoreLabels()
        }
        
        if animationStyle == .lineByLine{
            animationIntervalController = 50
            if numberOfDots > 10 {
                animationIntervalController = 15
            }
            if numberOfDots > 30 {
                animationIntervalController = 1
            }
        }
        else {
            drawLines()
        }
    }
    
    open override func didChangeSize(_ oldSize: CGSize) {
        start()
    }
    
    func calculateXCoordinate(_ i : CGFloat, r : CGFloat) -> CGFloat {
        let center = (self.size.width / 2)
        let sinRes = sin(i * 2 * CGFloat.pi / CGFloat(numberOfDots))
        return center + r * sinRes
    }
    
    func calculateYCoordinate(_ i : CGFloat, r : CGFloat) -> CGFloat {
        return (self.size.height / 2) + r * cos(i * 2 * CGFloat.pi / CGFloat(numberOfDots))
    }
    
    open override func update(_ currentTime: TimeInterval) {
        if animationStyle == .lineByLine && animationTick % animationIntervalController == 0 {
            if animationCount <= numberOfDots {
                for dot in 1 ... animationCount {
                    let x = calculateXCoordinate(CGFloat(dot), r: radius)
                    let y = calculateYCoordinate(CGFloat(dot), r: radius)
                    let origin : CGPoint = CGPoint(x: x, y: y)
                    
                    let aux = Int(CGFloat(dot) * multiplication) % numberOfDots
                    let xt = calculateXCoordinate(CGFloat(aux), r: radius)
                    let yt = calculateYCoordinate(CGFloat(aux), r: radius)
                    let target = CGPoint(x: xt,y: yt)
                    
                    createLine(origin: origin, target: target)
                    
                }
                animationCount += 1
            }
        }
        
        if animationStyle == .multiplicationTransition && animationTick % 3 == 0 {
            self.removeAllChildren()
            mainCircle()
            drawLines()
            multiplication += 0.05
        }
        
        animationTick += 1
        
    }
    
    func drawLines(){
        for dot in 1 ... numberOfDots {
            let x = calculateXCoordinate(CGFloat(dot), r: radius)
            let y = calculateYCoordinate(CGFloat(dot), r: radius)
            let origin : CGPoint = CGPoint(x: x, y: y)
            
            let aux = Int(CGFloat(dot) * multiplication) % numberOfDots
            let xtarget = calculateXCoordinate(CGFloat(aux), r: radius)
            let ytarget = calculateYCoordinate(CGFloat(aux), r: radius)
            let target = CGPoint(x: xtarget, y: ytarget)
            createLine(origin: origin, target: target)
        }
    }
    
    func createLine(origin : CGPoint, target : CGPoint){
        var line = SKShapeNode()
        var pathToDraw = CGMutablePath()
        pathToDraw.move(to: origin)
        pathToDraw.addLine(to: target)
        line.path = pathToDraw
        line.strokeColor = color
        line.glowWidth = 1.0
        addChild(line)
    }
    
    func mainCircle(){
        radius = (size.width*0.7)/2
        var circle = SKShapeNode(circleOfRadius: radius)
        circle.strokeColor = SKColor.gray
        circle.position.x = self.size.width / 2
        circle.position.y = self.size.height / 2
        circle.glowWidth = 1.0
        self.addChild(circle)
    }
    
    func drawLabels() {
        for dot in 1 ... numberOfDots {
            let x = calculateXCoordinate(CGFloat(dot), r: radius*1.1)
            let y = calculateYCoordinate(CGFloat(dot), r: radius*1.1)
            let position : CGPoint = CGPoint(x: x, y: y-10)
            
            if dot != numberOfDots {
                createLabel(i: dot, position: position, alpha: 1)
            }
            else {
                createLabel(i: 0, position: position, alpha: 1)
            }
            
        }
    }
    func drawMoreLabels() {
        for d in 1...3 {
            for u in 0...9 {
                let r : CGFloat = radius*(10+CGFloat(d+1))/10
                let x = calculateXCoordinate(CGFloat(u), r: r)
                let y = calculateYCoordinate(CGFloat(u), r: r)
                let position : CGPoint = CGPoint(x: x, y: y-10)
                
                createLabel(i: d*10+u, position: position, alpha: 1/(CGFloat(d+1)))
            }
        }
    }
    
    func createLabel(i : Int, position: CGPoint, alpha: CGFloat) {
        var label = SKLabelNode()
        label.text = String(i)
        label.position = position
        label.fontSize = 20
        label.fontColor = color
        label.alpha = alpha
        
        addChild(label)
    }
}


