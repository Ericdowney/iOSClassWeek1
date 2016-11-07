//: [Previous](@previous)

import UIKit
import SpriteKit
import PlaygroundSupport

let view = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
let skView = SKView(frame: view.frame)

view.addSubview(skView)

class MyScene: SKScene {
    
    var sprite: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        sprite = SKSpriteNode(color: .red, size: CGSize(width: 50, height: 50))
        sprite.position = skView.center
        addChild(sprite)
        
        configureWorld()
    }
    
    func configureWorld() {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        
        sprite.physicsBody = SKPhysicsBody(rectangleOf: sprite.size)
        sprite.physicsBody?.isDynamic = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        moveSprite(by: touches.first)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        moveSprite(by: touches.first)
    }
    
    func moveSprite(by touch: UITouch?) {
        if let location = touch?.location(in: self) {
            sprite.position = location
        }
    }
}

let scene = MyScene(size: skView.frame.size)
skView.presentScene(scene)
//skView.showsPhysics = true
skView.showsFPS = true
skView.showsNodeCount = true

PlaygroundPage.current.liveView = view

//: [Next](@next)
