//
//  AvatarModelComponent.swift
//  TheArena
//
//  Created by Eugene Krapivenko on 27.09.2021.
//

import GameplayKit

class AvatarModelComponent: GKComponent {
    
    var node: AvatarModelNode = AvatarModelNode(size: LobbyElements.avatarModelPanel)
    
}

extension AvatarModelComponent {
    
    override func didAddToEntity() {
        if let dragAndDropNode = entity?.component(ofType: DragAndDropComponent.self)?.node {
            node.position = CGPoint(x: -dragAndDropNode.frame.width/4, y: 0)
            node.zPosition = dragAndDropNode.zPosition + 5
            node.name = "AvatarModel"
            
            dragAndDropNode.addChild(node)
        }
    }
    
}
