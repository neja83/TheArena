//
//  SkillMovingComponent.swift
//  TheArena
//
//  Created by Eugene Krapivenko on 08.09.2021.
//

import GameplayKit

class SkillMovingComponent: GKComponent {
    
    private(set) var movingSkill: CellOfSkill?
//    private(set) var oldParent:
    
    func setMovingSkill(_ skill: CellOfSkill) {
        movingSkill = skill
    }
    
}

