//
//  PreloadFightScene.swift
//  TheArena
//
//  Created by Eugene Krapivenko on 02.09.2021.
//

import GameplayKit

extension FightScene {
    
    override func sceneDidLoad() {
        entityManager = EntityManager()
        entityManager?.rootNode = self
        
        entityManager?.add(entities: EntityFactory().task(describing: SceneList.fight(as: self)))
        
        // FIXME: переводить сцену в состояние loading
        // и загружать ее убирая статус loading
    }
    
}
