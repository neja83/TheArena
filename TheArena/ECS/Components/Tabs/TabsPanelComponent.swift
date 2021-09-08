//
//  TabsPanelComponent.swift
//  TheArena
//
//  Created by Eugene Krapivenko on 03.09.2021.
//

import GameplayKit

class TabsPanelComponent: GKComponent {
    
    typealias onClick = ((Button) -> Void )
    
    var statsButton: Button?
    var skillsButton: Button?
    var inventotyButton: Button?
    
    func configurateButton(type: TabButton, textureName: String, action: @escaping onClick) {

        let button: Button = Button(fileName: textureName)
        button.onClick = action
        
        switch type {
            case .stats:
                statsButton = button
            case .skills:
                skillsButton = button
            case .inventoty:
                inventotyButton = button
        }
        
        if let body = entity?.component(ofType: VisualComponent.self)?.node {
            if let frame = entity?.component(ofType: FrameComponent.self)?.shape {
                let frameSize = frame.frame.size
                var xPosition: CGFloat = 0
                
                switch type {
                    case .stats:
                        xPosition = -frameSize.width/3
                    case .skills: xPosition = 0
                    case .inventoty: xPosition = frameSize.width/3
                }
                
                button.position = CGPoint(x: xPosition, y: frameSize.height/2 - button.size.height/2 - 8)
                button.zPosition = 5
            }
            
            body.addChild(button)
        }
    }
}

enum TabButton: String {
    case stats
    case skills
    case inventoty
}
