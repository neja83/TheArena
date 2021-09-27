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

    func isEqual(to: Item) -> Bool;
}

extension Item where Self: Equatable {
    static func ==(lhs: Self, rhs: Self) -> Bool {
        lhs.node.isEqual(to: rhs.node)
    }
}
