//
//  CellWithItem.swift
//  TheArena
//
//  Created by Eugene Krapivenko on 15.09.2021.
//

struct CellWithItem: Equatable {
    
    var cell: Cell
    var item: Item
    
    static func == (first: CellWithItem, second: CellWithItem) -> Bool {
        (first.cell.id == second.cell.id) && (first.item.id == second.item.id)
    }
}
