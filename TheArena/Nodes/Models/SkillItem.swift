//
//  SkillItem.swift
//  TheArena
//
//  Created by Eugene Krapivenko on 08.09.2021.
//

protocol Item {
    var name: String { get }
    var description: String { get }
//    var texture: SKTexture { get }
}

class  SkillItem: Item {
    var name: String
    
    var description: String
    
    init(name: String, description: String) {
        self.name = name
        self.description = description
    }
}
