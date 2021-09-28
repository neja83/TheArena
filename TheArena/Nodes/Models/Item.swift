//
//  Item.swift
//  TheArena
//
//  Created by Eugene Krapivenko on 13.09.2021.
//

import SpriteKit

protocol Item {
    
    var id: Int32 { get }
    
    var node: ItemNode { get }
    
    var type: ItemType { get }
    
    var cell: Cell? { get set }

    func isEqual(to: Item) -> Bool;
}

extension Item where Self: Equatable {
    static func ==(lhs: Self, rhs: Self) -> Bool {
        lhs.node.isEqual(to: rhs.node)
    }
}


enum ItemType: String {
    
    case skill
    case oneHand
    case twoHands
    case shield
    
}
