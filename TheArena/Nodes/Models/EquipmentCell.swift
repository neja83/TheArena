//
//  EquipmentCell.swift
//  TheArena
//
//  Created by Eugene Krapivenko on 27.09.2021.
//

import GameplayKit

class EquipmentCell: Cell {
    var id: Int32
    
    var node: SKNode
    
    var type: ItemType
    
    var item: Item?
    
    init(id: Int32, node: SKNode, type: ItemType) {
        self.id = id
        self.node = node
        self.type = type
    }
    
    func isEqual(to: Cell) -> Bool {
        node.isEqual(to: to.node)
    }
}
