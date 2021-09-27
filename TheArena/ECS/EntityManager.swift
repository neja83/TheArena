//
//  EntityManager.swift
//  TheArena
//
//  Created by Eugene Krapivenko on 01.09.2021.
//

import GameplayKit

class EntityManager {
    
    private var entities: [GKEntity] = []
    private var systems:  [GKComponentSystem] = {
        let tabsStateComponent = GKComponentSystem.init(componentClass: TabsStateComponent.self)
        let spellMovingSystem = GKComponentSystem.init(componentClass: MovingComponent.self)
        
        return [tabsStateComponent, spellMovingSystem]
    }()
    
    var rootNode: SKNode?
    
    func removedFromParent() {
        self.rootNode = nil
        self.entities = []
    }
    
    // MARK: - Entities
    public func add(entity: GKEntity) {
        // add in list
        entities.append(entity)
        
        // mount in root node if entity has visual part
        addToNode(entity)
        
        // add in system
        for system in systems {
            system.addComponent(foundIn: entity)
        }
        
    }
    
    public func add(entities list: [GKEntity]) {
        for entity in list {
            add(entity: entity)
        }
    }
    
    public func delete(entity: GKEntity) -> Bool {
        if let index = entities.firstIndex(of: entity) {
            // Удаляем представление entity на сцене
            if let node = entity.component(ofType: VisualComponent.self)?.node {
                node.removeFromParent()
            }
            
            entities.remove(at: index)
            return true
        }
        return false
    }
    
    // MARK: - Root node
    private func addToNode(_ entity: GKEntity) {
        if let node = entity.component(ofType: VisualComponent.self)?.node {
            if let show = entity.component(ofType: ShowComponent.self)?.show {
                if (show) {
                    rootNode?.addChild(node)
                }
            } else {
                rootNode?.addChild(node)
            }
        }
    }
    
    func update(_ dt: TimeInterval) {
        for system in systems {
            system.update(deltaTime: dt)
        }
    }
    
    deinit {
        print("de init manager")
    }
}
