//
//  SceneLoader.swift
//  TheArena
//
//  Created by Eugene Krapivenko on 25.08.2021.
//

import SpriteKit

protocol SceneSwitching {
    var name: String { get }
    var scene: SKScene? { get }
    var nextScene: ((Button) -> ()) { get }
}

enum SceneCreator {
    case lobby(oldScene: SKScene)
    case fight(oldScene: SKScene)
}

extension SceneCreator: SceneSwitching {
    var nextScene: ((Button) -> ()){
        switch self {
            case .lobby(let oldScene): return nextPage(for: oldScene)
            case .fight(let oldScene): return nextPage(for: oldScene)
        }
    }
    
    func nextPage(for oldScene: SKScene) -> ((Button) -> Void) {
        return { _ in
            if let nextScene = self.scene {
                oldScene.view?.presentScene(nextScene, transition: .doorsCloseHorizontal(withDuration: 1))
            } else {
                // FIXME: Сreate a notification system
                print("Ошибка создания новой сцены")
            }
        }
    }
    
    var scene: SKScene? {
        switch self {
            case .lobby:
                let scene = SKScene(fileNamed: self.name)
                scene?.scaleMode = .aspectFill
                return scene
                
            case .fight:
                let scene = SKScene(fileNamed: self.name)
                scene?.scaleMode = .aspectFill
                return scene
        }
    }
    
    var name: String {
        switch self {
        case .lobby: return "LobbyScene"
        case .fight: return "FightScene"
        }
    }
}
