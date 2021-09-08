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
        let showComponent = ShowComponent(show: false)
        let activeSkillsComponent = ActiveSkillComponent()
        let commonSkillsComponent = CommonSkillsComponent()
    
        addComponent(showComponent)
        addComponent(visualComponent)
        addComponent(activeSkillsComponent)
        addComponent(commonSkillsComponent)
        
        let item: Item = SkillItem(name: "Knock", description: "Knock")
        let skill: CellOfSkill = CellOfSkill(item: item)
        skill.name = "Skill"
        
        activeSkillsComponent.add(skill: skill)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
