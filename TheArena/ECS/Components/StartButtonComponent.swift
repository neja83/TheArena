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
        super.init()
        
        setupButton(position: position, action: action)
    }
    
    init(texture: SKTexture , position: CGPoint = .zero, action: onClickAction? = nil) {
        button = Button(texture: texture)
        super.init()
        
        setupButton(position: position, action: action)
    }
    
    private func setupButton(position: CGPoint, action: onClickAction?) {
        button.name = "Run button"
        button.onClick = action
        button.position = position
    }
    
    override func didAddToEntity() {
        if let visualNode = entity?.component(ofType: VisualComponent.self)?.node {
            button.zPosition = visualNode.zPosition + 5
            visualNode.addChild(button)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
