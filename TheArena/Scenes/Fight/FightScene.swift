//
//  FightScene.swift
//  TheArena
//
//  Created by Eugene Krapivenko on 24.08.2021.
//

import SpriteKit
import GameplayKit

class FightScene: SKScene {
    
    var entityManager: EntityManager?
    
    override func didMove(to view: SKView) {
       
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let first = touches.first else { return }
        
        let nodes = nodes(at: first.location(in: self))
        
        for node in nodes {
            node.touchesBegan(touches, with: event)
        }
    }
    
    /// Clearing scene befor deinit
    override func willMove(from view: SKView) {
        self.removeAllChildren()
        self.removeAllActions()
        entityManager?.removedFromParent()
    }
    
    deinit {
        print("deinit fight scene")
    }
}

