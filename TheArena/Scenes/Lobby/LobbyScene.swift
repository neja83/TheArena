//
//  LobbyScene.swift
//  TheArena
//
//  Created by Eugene Krapivenko on 24.08.2021.
//

import GameplayKit

// size (1334.0, 750.0)

class LobbyScene: SKScene {
    
    var entityManager: EntityManager?
    
    var lastUpdateTime: TimeInterval = 0
    
    override func didMove(to view: SKView) {
//        self.backgroundColor = .blue
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let first = touches.first else { return }
        
        let nodes = nodes(at: first.location(in: self))
        
        for node in nodes {
            node.touchesBegan(touches, with: event)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let first = touches.first else { return }
        
        let nodes = nodes(at: first.location(in: self))
        
        for node in nodes {
            node.touchesMoved(touches, with: event)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let first = touches.first else { return }
        
        let nodes = nodes(at: first.location(in: self))
        
        for node in nodes {
            node.touchesEnded(touches, with: event)
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let first = touches.first else { return }
        
        let nodes = nodes(at: first.location(in: self))
        
        for node in nodes {
            node.touchesCancelled(touches, with: event)
        }
    }
    
    /// Clearing scene befor deinit
    override func willMove(from view: SKView) {
        self.removeAllChildren()
        self.removeAllActions()
        entityManager?.removedFromParent()
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        // Initialize _lastUpdateTime if it has not already been
        if self.lastUpdateTime == 0 {
            self.lastUpdateTime = currentTime
        }
        
        // Calculate time since last update
        let dt = currentTime - self.lastUpdateTime
        
        self.entityManager?.update(dt)
        
        self.lastUpdateTime = currentTime
    }
    
    deinit {
        print("LobbyScene deinit")
    }
}


// MARK: - kill me
enum LobbyElements {
    static let avatarSize: CGSize    = CGSize(width: 400, height: 580)
    static let tabsSize: CGSize      = CGSize(width: 800, height: 580)
    static let tabsPanelSize: CGSize = CGSize(width: 250, height: 135)
    static let contentSize: CGSize   = CGSize(width: 800, height: 429)
    static let activeSkillPanel: CGSize = CGSize(width: 260, height: 429)
    static let skillRadius: CGFloat = 50
    static let commonSkillPanel: CGSize = CGSize(width: 520, height: 429)
    static let equipmentPanel: CGSize = CGSize(width: 400, height: 429)
    static let avatarModelPanel: CGSize = CGSize(width: 400, height: 429)
}
