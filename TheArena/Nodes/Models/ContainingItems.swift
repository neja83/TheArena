//
//  ContainingItems.swift
//  TheArena
//
//  Created by Eugene Krapivenko on 23.09.2021.
//

/// Создание и сохранение объекта в объекте реализации
protocol ContainingItems {
    func create();
    func startMoving(item: Item)
    func delete();
    func moveBack(item: Item);
    func save(item: Item);
    
    func isEqual(to: ContainingItems) -> Bool;
}

extension ContainingItems where Self: Equatable {
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.isEqual(to: rhs)
    }
}
