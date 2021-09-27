//
//  VisualComponent.swift
//  TheArena
//
//  Created by Eugene Krapivenko on 01.09.2021.
//

import GameplayKit

class VisualComponent: GKComponent {
    
    var node: SKNode
    
    init(textureName: String) {
        let texture = SKTexture(imageNamed: textureName)
        node = SKSpriteNode(texture: texture, size: texture.size())
        node.name = "VisualComponent"
        super.init()
    }
    
    init(node: SKNode) {
        self.node = node
        self.node.name = "VisualComponent"
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
