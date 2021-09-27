//
//  StatisticEntity.swift
//  TheArena
//
//  Created by Eugene Krapivenko on 04.09.2021.
//

import GameplayKit

class Statistic: GKEntity {
    
    // FIXME переделать конструктор
    init(textureName: String, buttonTextureName: String, onStartClick: @escaping ((Button) -> ())) {
        super.init()
        
        let visualComponent = VisualComponent(textureName: textureName, zPosition: 5)
        let showComponent =   ShowComponent()
        
        let startButtonTexture = SKTexture(imageNamed: buttonTextureName)
        let startButtonPosition = CGPoint(x: LobbyElements.contentSize.width/4, y: 0)
        let startButtonComponent = StartButtonComponent(texture: startButtonTexture ,position: startButtonPosition, action: onStartClick)
        
        let retingComponent = RatingComponent()
        
        addComponent(showComponent)
        addComponent(visualComponent)
        addComponent(retingComponent)
        addComponent(startButtonComponent)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
