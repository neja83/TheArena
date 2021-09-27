//
//  Avatar.swift
//  TheArena
//
//  Created by Eugene Krapivenko on 03.09.2021.
//

import GameplayKit

class Avatar: GKEntity {
    
    init(bodyTexture: String, name: String) {
        super.init()
        
        let visualComponent   = VisualComponent(textureName: bodyTexture)
        let nicknameComponent = NicknameComponent(name: name)
        let frameComponent    = FrameComponent(size: LobbyElements.avatarSize, color: .systemPink)
        
        addComponent(visualComponent)
        addComponent(nicknameComponent)
        addComponent(frameComponent)
       
        let labelPosition = CGPoint(x: 0, y: visualComponent.node.frame.size.height / 2 + nicknameComponent.text.frame.size.height / 2 + 8)
        nicknameComponent.text.position = labelPosition
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
