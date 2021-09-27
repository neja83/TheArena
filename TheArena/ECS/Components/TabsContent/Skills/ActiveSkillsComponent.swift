//
//  ActiveSkillsComponent.swift
//  TheArena
//
//  Created by Eugene Krapivenko on 06.09.2021.
//

import GameplayKit

class ActiveSkillComponent: GKComponent {
    
    var node: ListNode =  ListNode(size: LobbyElements.activeSkillPanel)
    
}

extension ActiveSkillComponent {
    
    override func didAddToEntity() {
        if let node = entity?.component(ofType: DragAndDropComponent.self)?.node {
            self.node.position = CGPoint(x: -node.frame.size.width/3, y: 0)
            self.node.zPosition = 10
            self.node.name = "ActiveSkillComponent"
            
            node.entity = entity
            node.addChild(self.node)
        }
    }
}
