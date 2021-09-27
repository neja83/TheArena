//
//  Cell.swift
//  TheArena
//
//  Created by Eugene Krapivenko on 13.09.2021.
//

import  SpriteKit

protocol Cell {
    var id: Int32 { get }
    var node: SKNode { get }
    
    func isEqual(to: Cell) -> Bool;
}
