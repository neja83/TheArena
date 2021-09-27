//
//  MovingComponent.swift
//  TheArena
//
//  Created by Eugene Krapivenko on 23.09.2021.
//

import GameplayKit

class MovingComponent: GKComponent {
    
    private(set) var isMoving: Bool = false
    
    private(set) var stop:  Bool = false
    
    func setIsMoving(_ value: Bool) {
        isMoving = false
    }
    
    func startMoving() {
        print(#function)
        isMoving = true
    }
    
    func stopMoving() {
        print(#function)
        isMoving = false
        stop = true
    }
    
    func setStop(_ value: Bool) {
        stop = value
    }
}

extension MovingComponent {
    
    override func update(deltaTime seconds: TimeInterval) {
        guard stop else { return }
        
        print("network request")
        
        setStop(false)
    }
    
}
