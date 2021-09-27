//
//  DragAndDropComponent.swift
//  TheArena
//
//  Created by Eugene Krapivenko on 14.09.2021.
//

import GameplayKit

/// Component for registration moving intems and save it in drop area
class DragAndDropComponent: GKComponent {
    
    var node: DragAndDropNode
    
    init(texture: SKTexture) {
        node = DragAndDropNode(texture: texture)
        node.name = "DragAndDropComponent"
        super.init()
    }
    
    init(textureName: String) {
        let texture: SKTexture = SKTexture(imageNamed: textureName)
        node = DragAndDropNode(texture: texture)
        node.name = "DragAndDropComponent"
        
        super.init()
    }
    
    override func didAddToEntity() {
        if let visualNode = entity?.component(ofType: VisualComponent.self)?.node {
            visualNode.addChild(node)
            node.zPosition = visualNode.zPosition + 5
            node.entity = entity
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
