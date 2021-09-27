//
//  SkillItem.swift
//  TheArena
//
//  Created by Eugene Krapivenko on 20.09.2021.
//

import GameplayKit

class SkillItem {
    
    var id: Int32
    var node: ItemNode
    
    init(id: Int32, node: ItemNode) {
        self.id = id
        self.node = node
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension SkillItem: Item {
    func isEqual(to: Item) -> Bool {
        node.isEqual(to: to.node)
    }
}
