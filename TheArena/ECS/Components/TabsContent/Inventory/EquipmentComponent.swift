//
//  EquipmentComponent.swift
//  TheArena
//
//  Created by Eugene Krapivenko on 27.09.2021.
//

import GameplayKit

class EquipmentComponent: GKComponent {
    
    var node: ListNode = ListNode(size: LobbyElements.equipmentPanel)
    
}

extension EquipmentComponent {
    
    override func didAddToEntity() {
        if let dragAndDropNode = entity?.component(ofType: DragAndDropComponent.self)?.node {
            node.position = CGPoint(x: dragAndDropNode.frame.width/4, y: 0)
            node.zPosition = dragAndDropNode.zPosition + 5
            node.name = "Equipment"
            
            let item1 = addTestItem(color: .blue, type: .oneHand)
            let item2 = addTestItem(color: .orange, type: .oneHand)
            let item3 = addTestItem(color: .darkGray, type: .shield)
            node.add(items: [item1, item2, item3])
            
            dragAndDropNode.addChild(node)
        }
    }
    
    private func addTestItem(color: UIColor, type: ItemType) -> Item {
        let itemNode = ItemNode(radius: LobbyElements.skillRadius - 10)
        itemNode.name = "Equipment item \(type)"
        itemNode.fillColor = color
        itemNode.position = .zero
        itemNode.zPosition = 20
        let equipmentItem = EquipmentItem(id: Int32.random(in: 1...Int32.max), node: itemNode, type: type)
        itemNode.item = equipmentItem
        
        return equipmentItem
    }
    
}
