//
//  StartButtonComponent.swift
//  TheArena
//
//  Created by Eugene Krapivenko on 03.09.2021.
//

import GameplayKit

class StartButtonComponent: GKComponent {
    
    typealias onClickAction = ((Button) -> ())
    
    var button: Button
    
    init(textureName: String , position: CGPoint = .zero, action: onClickAction? = nil) {
        button = Button(fileName: textureName)
        button.onClick = action
        button.position = position
        
        super.init()
    }
    
    init(texture: SKTexture , position: CGPoint = .zero, action: onClickAction? = nil) {
        button = Button(texture: texture)
        button.onClick = action
        button.position = position
        button.zPosition = 5
        
        super.init()
    }
    
    override func didAddToEntity() {
        if let body = entity?.component(ofType: VisualComponent.self)?.node {
            
            body.addChild(button)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
