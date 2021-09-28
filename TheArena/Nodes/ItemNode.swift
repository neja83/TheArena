//
//  ItemBody.swift
//  TheArena
//
//  Created by Eugene Krapivenko on 13.09.2021.
//

import SpriteKit
import GameplayKit

class ItemNode: SKShapeNode {
    
    var item: Item?
    
    private var isMoving: Bool = false
    
    init(radius: CGFloat) {
        super.init()
        
        // FIXME: - calculate circle right!
        let node = SKShapeNode(circleOfRadius: radius)
        path = node.path
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        isMoving = true
        zPosition += 5
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let first = touches.first else { return }
        
        if isMoving {
            position = first.location(in: self.parent!)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isMoving {
            zPosition -= 5
        }
        isMoving = false
    }
}
