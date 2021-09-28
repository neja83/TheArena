//
//  FrameComponent.swift
//  TheArena
//
//  Created by Eugene Krapivenko on 03.09.2021.
//

import GameplayKit

class FrameComponent: GKComponent {
    
    var shape: SKShapeNode
    
    init(size: CGSize, color: UIColor = .white) {
        shape = SKShapeNode(rectOf: size)
        shape.name = "Frame"
        shape.position = .zero
        shape.strokeColor = color
        
        super.init()
    }
    
    override func didAddToEntity() {
        if let visualNode = entity?.component(ofType: VisualComponent.self)?.node {
            shape.zPosition = visualNode.zPosition + 5
            visualNode.addChild(shape)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
