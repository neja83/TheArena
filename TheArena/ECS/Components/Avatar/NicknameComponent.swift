//
//  NicknameComponent.swift
//  TheArena
//
//  Created by Eugene Krapivenko on 03.09.2021.
//

import GameplayKit

class NicknameComponent: GKComponent {
    
    var text: SKLabelNode
    
    init(name: String, position: CGPoint = .zero) {
        text = SKLabelNode(text: name)
        text.fontColor = .white
        text.fontSize = 50
        text.position = position
        
        super.init()
    }

    override func didAddToEntity() {
        if let body = entity?.component(ofType: VisualComponent.self)?.node {
            body.addChild(text)
        }
    }
    
    override func willRemoveFromEntity() {
        text.removeFromParent()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
