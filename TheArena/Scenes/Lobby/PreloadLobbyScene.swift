//
//  PreloadLobbyScene.swift
//  TheArena
//
//  Created by Eugene Krapivenko on 01.09.2021.
//

import SpriteKit
import GameplayKit

extension LobbyScene {
   
    override func sceneDidLoad() {
        entityManager = EntityManager()
        entityManager?.rootNode = self
        
        entityManager?.add(entities: EntityFactory().task(describing: SceneList.lobby(as: self)))
        
        // FIXME: переводить сцену в состояние loading
        // и загружать ее убирая статус loading
    }
    
}
