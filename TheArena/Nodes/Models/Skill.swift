//
//  Skill.swift
//  TheArena
//
//  Created by Eugene Krapivenko on 20.09.2021.
//

import GameplayKit

class Skill {
    
    var id: Int32
    
    var node: ItemNode
    
    var type: ItemType
    
    var cell: Cell?
    
    init(id: Int32, node: ItemNode, type: ItemType) {
        self.id = id
        self.node = node
        self.type = type
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension Skill: Item {
    func isEqual(to: Item) -> Bool {
        node.isEqual(to: to.node)
    }
}
