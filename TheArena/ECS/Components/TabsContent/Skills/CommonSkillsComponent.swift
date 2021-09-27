//
//  CommonSkillsComponent.swift
//  TheArena
//
//  Created by Eugene Krapivenko on 08.09.2021.
//

import GameplayKit

class CommonSkillsComponent: GKComponent {
    
    var node: ListNode = ListNode(size: LobbyElements.commonSkillPanel)
    
}

extension CommonSkillsComponent {
    
    override func didAddToEntity() {
        if let dragAndDropNode = entity?.component(ofType: DragAndDropComponent.self)?.node {
            node.position = CGPoint(x: dragAndDropNode.frame.size.width/6, y: 0)
            node.zPosition = dragAndDropNode.zPosition + 5
            node.name = "CommonSkillsComponent"
            
            let item  = addTestItem(color: .purple)
            let item2 = addTestItem(color: .orange)
            let item3 = addTestItem(color: .blue)
            node.add(items: [item, item2, item3])
            
            dragAndDropNode.addChild(node)
        }
    }
    
    private func addTestItem(color: UIColor) -> Item {
        let itemNode = ItemNode(radius: LobbyElements.skillRadius - 10)
        itemNode.name = "Item"
        itemNode.fillColor = color
        itemNode.position = .zero
        itemNode.zPosition = 20
        let item = SkillItem(id: Int32.random(in: 1...Int32.max), node: itemNode)
        itemNode.item = item
        
        return item
    }
}
