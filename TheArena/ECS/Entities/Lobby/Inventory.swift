//
//  Inventory.swift
//  TheArena
//
//  Created by Eugene Krapivenko on 04.09.2021.
//

import GameplayKit

class Inventory: GKEntity {
    
    init(textureName: String) {
        super.init()
        
        let visualComponent = VisualComponent(textureName: textureName, zPosition: 5)
        let dragAndDropComponent = DragAndDropComponent(textureName: textureName)
        let showComponent = ShowComponent(show: false)
        let equipmentComponent = EquipmentComponent()
        let avatarModelComponent = AvatarModelComponent()
        
        addComponent(showComponent)
        addComponent(visualComponent)
        addComponent(dragAndDropComponent)
        addComponent(avatarModelComponent)
        addComponent(equipmentComponent)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
