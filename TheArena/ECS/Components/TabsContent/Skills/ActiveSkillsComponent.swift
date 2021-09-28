//
//  ActiveSkillsComponent.swift
//  TheArena
//
//  Created by Eugene Krapivenko on 06.09.2021.
//

import GameplayKit

class ActiveSkillsComponent: GKComponent {
    
    var node: ListNode =  ListNode(size: LobbyElements.activeSkillPanel, maxCount: 2)
    
}

extension ActiveSkillsComponent {
    
    override func didAddToEntity() {
        if let dragAndDropNode = entity?.component(ofType: DragAndDropComponent.self)?.node {
            node.position = CGPoint(x: -dragAndDropNode.frame.size.width/3, y: 0)
            node.zPosition = dragAndDropNode.zPosition + 5
            node.name = "ActiveSkillsComponent"
            
            node.entity = entity
            dragAndDropNode.addChild(node)
        }
    }
}
