//
//  Skills.swift
//  TheArena
//
//  Created by Eugene Krapivenko on 04.09.2021.
//

import GameplayKit

class Skills: GKEntity {
    
    init(textureName: String) {
        super.init()
        
        let visualComponent = VisualComponent(textureName: textureName)
        let dragAndDropComponent = DragAndDropComponent(textureName: textureName)
        let showComponent = ShowComponent(show: false)
        let activeSkillsComponent = ActiveSkillComponent()
        let commonSkillsComponent = CommonSkillsComponent()
        let movingComponent = MovingComponent()
    
        addComponent(showComponent)
        addComponent(visualComponent)
        addComponent(dragAndDropComponent)
        addComponent(activeSkillsComponent)
        addComponent(commonSkillsComponent)
        addComponent(movingComponent)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
