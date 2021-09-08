//
//  EntityList.swift
//  TheArena
//
//  Created by Eugene Krapivenko on 02.09.2021.
//

import GameplayKit

/// Список статических сцен
enum SceneList {
    case lobby(as: SKScene)
    case fight(as: SKScene)
}

extension SceneList: SceneDescribing {
    
    var scene: SKScene {
        switch self {
            case .lobby(let scene): return scene
            case .fight(let scene): return scene
        }
    }
    
    var type: SceneType {
        switch self {
            case .lobby: return SceneType.lobby
            case .fight: return SceneType.fight
        }
    }
    
}
