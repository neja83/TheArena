//
//  ActiveSkillsComponent.swift
//  TheArena
//
//  Created by Eugene Krapivenko on 06.09.2021.
//

import GameplayKit

class ActiveSkillComponent: GKComponent {
    
    private(set) var skills: [CellOfSkill] = []
    
    var body: SKShapeNode = SKShapeNode(rectOf: LobbyElements.activeSkillPanel)
    
    func add(skill: CellOfSkill) {
        guard !skills.contains(skill) else { return }
        
        skill.onMove = delete
        
        skill.position = getSkillPosition(of: skill)
        skill.zPosition = 15
        skills.append(skill)
        
        body.addChild(skill)
    }
    
    func delete(skill: CellOfSkill) {
        guard !skills.isEmpty, let index = skills.firstIndex(of: skill) else { return }
        
        skills.remove(at: index)
        for (key, item) in skills.enumerated() {
            let oldPosition = item.position
            
            let newPosition = getSkillPosition(of: item, count: CGFloat(key))
            
            if !oldPosition.equalTo(newPosition) {
                
                item.position = newPosition
            }
        }
    }
    
    private func getSkillPosition(of skill: CellOfSkill) -> CGPoint {
        let size = LobbyElements.activeSkillPanel
        let number = CGFloat(skills.count)
        let elemetSize = CGSize(width: LobbyElements.skillRadius*2, height: LobbyElements.skillRadius*2)

        return CGPoint(x: -elemetSize.width/2, y: size.height/2 - number * elemetSize.height - elemetSize.height/2)
    }
    
    private func getSkillPosition(of skill: CellOfSkill, count: CGFloat) -> CGPoint {
        let size = LobbyElements.activeSkillPanel
        let elemetSize = skill.frame.size
        
        return CGPoint(x: 0, y: size.height/2 - count * elemetSize.height - elemetSize.height/2)
    }
}

extension ActiveSkillComponent {
    
    override func didAddToEntity() {
        if let node = entity?.component(ofType: VisualComponent.self)?.node {
            body.position = CGPoint(x: -node.frame.size.width/3, y: 0)
            body.zPosition = 10
            node.addChild(body)
        }
    }
}
