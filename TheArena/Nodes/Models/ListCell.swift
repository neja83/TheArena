//
//  ListCell.swift
//  TheArena
//
//  Created by Eugene Krapivenko on 13.09.2021.
//

import SpriteKit

class ListCell: Cell {
    
    var id: Int32
    var node: SKNode
    
    init(id: Int32, node: SKNode) {
        self.id = id
        self.node = node
    }
    
    func isEqual(to: Cell) -> Bool {
        node.isEqual(to: to.node)
    }
}
