//
//  PositionComponent.swift
//  TheArena
//
//  Created by Eugene Krapivenko on 01.09.2021.
//

import GameplayKit

class PositionComponent: GKComponent {
    
    var position: CGPoint = .zero
    
    private var lastPosition: CGPoint = .zero
    
    init(position: CGPoint) {
        super.init()
        
        self.position = position
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didAddToEntity() {
        if let rootNode = entity?.component(ofType: VisualComponent.self)?.node {
            self.lastPosition = rootNode.position
            rootNode.position = self.position
        }
    }
}
