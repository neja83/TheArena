//
//  CommonSkillsComponent.swift
//  TheArena
//
//  Created by Eugene Krapivenko on 08.09.2021.
//

import GameplayKit

class CommonSkillsComponent: GKComponent {
    
    var body: ListNode = ListNode(size: LobbyElements.commonSkillPanel)
    
}

extension CommonSkillsComponent {
    
    override func didAddToEntity() {
        if let node = entity?.component(ofType: DragAndDropComponent.self)?.node {
            body.position = CGPoint(x: node.frame.size.width/6, y: 0)
            body.zPosition = 10
            body.name = "CommonSkillsComponent"
            
            let item  = addTestItem(color: .purple)
            let item2 = addTestItem(color: .orange)
            let item3 = addTestItem(color: .blue)
            body.add(items: [item, item2, item3])
            
            node.addChild(body)
        }
    }
    
    private func addTestItem(color: UIColor) -> Item {
        let itemNode = ItemNode(radius: LobbyElements.skillRadius - 10)
        itemNode.name = "Item \(color)"
        itemNode.fillColor = color
        itemNode.position = .zero
        itemNode.zPosition = 20
        let item = SkillItem(id: Int32.random(in: 1...Int32.max), node: itemNode)
        itemNode.item = item
        
        return item
    }
}
