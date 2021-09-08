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
        shape.position = .zero
        shape.strokeColor = color
        
        super.init()
    }
    
    override func didAddToEntity() {
        if let body = entity?.component(ofType: VisualComponent.self)?.node {
            body.addChild(shape)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
