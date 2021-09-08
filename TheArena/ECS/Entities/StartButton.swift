//
//  StartButton.swift
//  TheArena
//
//  Created by Eugene Krapivenko on 01.09.2021.
//

import GameplayKit

class StartButton: GKEntity {
    
    typealias onClickAction = ((Button) -> ())
    
    init(textureName: String, action: onClickAction? ) {
        super.init()
        
        let button = Button(fileName: textureName)
        button.onClick = action
        
        let visualComponent = VisualComponent(node: button)
        
        addComponent(visualComponent)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    } 
}
