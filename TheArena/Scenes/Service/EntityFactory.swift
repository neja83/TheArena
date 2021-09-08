//
//  SceneBuilder.swift
//  TheArena
//
//  Created by Eugene Krapivenko on 02.09.2021.
//

import GameplayKit

/// Служит для создания статических сущностей сцены
class EntityFactory {
    
    /// Задача на создание массива сужностей по описанию сцены
    func task(describing: SceneDescribing) -> [GKEntity] {
        let result = sceneBuilder(by: describing)
         
        return result
    }
    
    
    private func sceneBuilder(by describing: SceneDescribing) -> [GKEntity] {
        
        switch describing.type {
            case .lobby: return forLobby(scene: describing.scene)
        
            case .fight: return forFight(scene: describing.scene)
        }
        
    }
    
    private func forLobby(scene: SKScene) -> [GKEntity] {
        let sceneSize = scene.size
        
        let avatar = Avatar(bodyTexture: "userAvatar", name: "Pro100user")
        let avatarPosition = PositionComponent(position: CGPoint(x: -sceneSize.width/3 , y: 0))
        avatar.addComponent(avatarPosition)
        
        let tabs = Tabs()
        let tabsPosition = PositionComponent(position: CGPoint(x: sceneSize.width/6, y: 0))
        tabs.addComponent(tabsPosition)
        
        let tabState = tabs.component(ofType: TabsStateComponent.self)
        
        let stats = Statistic(textureName: "content", buttonTextureName: "button", onStartClick: SceneCreator.fight(oldScene: scene).nextScene)
        let statsPosition = PositionComponent(position: CGPoint(x: sceneSize.width/6, y: -67.5))
        stats.addComponent(statsPosition)
        tabState?.contents.updateValue(stats, forKey: .stats)
        
        let skills = Skills(textureName: "content")
        let skillsPosition = PositionComponent(position: CGPoint(x: sceneSize.width/6, y: -67.5))
        skills.addComponent(skillsPosition)
        tabState?.contents.updateValue(skills, forKey: .skills)
        
        let inventory = Inventory(textureName: "content")
        let inventoryPosition = PositionComponent(position: CGPoint(x: sceneSize.width/6, y: -67.5))
        inventory.addComponent(inventoryPosition)
        tabState?.contents.updateValue(inventory, forKey: .inventoty)
        
        return [avatar, tabs, stats, skills, inventory]
    }
    
    private func forFight(scene: SKScene) -> [GKEntity] {
        let button = StartButton(textureName: "button", action: SceneCreator.lobby(oldScene: scene).nextScene)
        let buttonPosition = PositionComponent(position: CGPoint(x: 0, y: -200))
        button.addComponent(buttonPosition)
        
        return [button]
    }
}

