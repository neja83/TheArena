//
//  EquipmentItem.swift
//  TheArena
//
//  Created by Eugene Krapivenko on 27.09.2021.
//

class EquipmentItem: Item {
    
    var id: Int32
    
    var node: ItemNode
    
    var type: ItemType
    
    var cell: Cell?
    
    init(id: Int32, node: ItemNode, type: ItemType) {
        self.id = id
        self.node = node
        self.type = type
    }
    
    func isEqual(to: Item) -> Bool {
        node.isEqual(to: to.node)
    }
}
