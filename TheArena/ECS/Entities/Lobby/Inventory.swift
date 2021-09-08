//
//  Inventory.swift
//  TheArena
//
//  Created by Eugene Krapivenko on 04.09.2021.
//

import GameplayKit

class Inventory: GKEntity {
    
    init(textureName: String) {
        super.init()
        
        let visualComponent = VisualComponent(textureName: textureName)
        let showComponent = ShowComponent(show: false)
        
        let frameComponent = FrameComponent(size: LobbyElements.contentSize, color: .cyan)
        
        addComponent(showComponent)
        addComponent(visualComponent)
        addComponent(frameComponent)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
