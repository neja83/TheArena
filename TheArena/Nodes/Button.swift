//
//  Button.swift
//  TheArena
//
//  Created by Eugene Krapivenko on 24.08.2021.
//

import SpriteKit

class Button: SKSpriteNode {
    
    var onClick: ((_ button: Button) -> ())?
    
    init(fileName: String) {
        let texture = SKTexture(imageNamed: fileName)
        let size = texture.size()
        super.init(texture: texture, color: .black, size: size)
    }
    
    init(texture: SKTexture) {
        let size = texture.size()
        super.init(texture: texture, color: .black, size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let action = self.onClick {
            
            action(self)
        }
    }
    
    deinit {
        print("deinit button")
    }
}
