//
//  TabStateSystem.swift
//  TheArena
//
//  Created by Eugene Krapivenko on 03.09.2021.
//

import GameplayKit

protocol ContentRendering {
    func render() -> Void
}

extension TabsStateComponent {

    func setSelected(_ type: TabButton) {
        self.newState = type
    }
    
    func setState(for tab: TabButton) {
        selected = tab
        newState = nil
    }
    
    override func update(deltaTime seconds: TimeInterval) {
        guard let newSelect = newState else { return }
        
        // hide old content
        let oldConten = contents[selected]
        
        if let body = oldConten?.component(ofType: VisualComponent.self)?.node {
            let rootNode = body.parent
            body.removeFromParent()
             
            // show new content
            let newContent = contents[newSelect]
            if let body = newContent?.component(ofType: VisualComponent.self)?.node {
                rootNode?.addChild(body)
            }
        }
        
        setState(for: newSelect)
    }
}
