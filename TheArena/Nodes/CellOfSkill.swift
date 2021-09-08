//
//  SkillCell.swift
//  TheArena
//
//  Created by Eugene Krapivenko on 06.09.2021.
//

import SpriteKit

class CellOfSkill: SKNode, Cell {

    // MARK: - Link with outer Item object
    var item: Item?
    
    // MARK: - Visual
    var circle: SKShapeNode
    var nameLabel: SKLabelNode
    var short: Bool
    
    // MARK: - Moving
    var startPosition: CGPoint?
    var lastPosition: CGPoint?
    var moving: Bool   = false {
        didSet {
            
        }
    }
    var selected: Bool = false
    var onMove: ((CellOfSkill) -> Void)?
    
    // MARK: - Init
    init(item: Item?, radius: CGFloat = LobbyElements.skillRadius, short: Bool = false) {
        self.circle    = SKShapeNode(circleOfRadius: radius)
        self.nameLabel = SKLabelNode(text: item?.name)
        self.short     = short
        self.item      = item
        super.init()
        
        setup(radius: radius)
    }
    
    func setup(radius: CGFloat) {
        circle.position = .zero
        circle.zPosition = 5
        
        let position: CGPoint
        if short {
            position = .zero
        } else {
            position = CGPoint(x: radius + nameLabel.frame.size.width/2 + 8, y: -nameLabel.frame.size.height/2)
        }
        
        nameLabel.position = position
        nameLabel.zPosition = 5
        
        addChild(circle)
        addChild(nameLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension CellOfSkill {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard touches.first != nil, parent != nil else { return }
        
        selected = true
        startPosition = position
        let _ = self.onMove?(self)
        
        let entity = parent?.entity
        if let skillMoving = entity?.component(ofType: SkillMovingComponent.self) {
            skillMoving.setMovingSkill(self)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let first = touches.first, let contentNode = parent?.parent else { return }
        
        let newPosition = first.location(in: contentNode)
        if lastPosition == nil {
            lastPosition = newPosition
        } else {
            let xRange = -LobbyElements.contentSize.width/2...LobbyElements.contentSize.width/2
            let yRange = -LobbyElements.contentSize.height/2...LobbyElements.contentSize.height/2
            
            if xRange.contains(newPosition.x) && yRange.contains(newPosition.y) {
                if let lastPosition = lastPosition {
                    let dX = lastPosition.x - newPosition.x
                    let dY = lastPosition.y - newPosition.y
                    let xPosition = dX > 0 ? position.x - abs(dX) : position.x + abs(dX)
                    let yPosition = dY > 0 ? position.y - abs(dY) : position.y + abs(dY)
                    
                    position = CGPoint(x: xPosition, y: yPosition)
                    self.lastPosition = newPosition
                }
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let startPosition = startPosition {
            position = startPosition
        }
        startPosition = nil
        lastPosition = nil
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let startPosition = startPosition {
            position = startPosition
        }
        startPosition = nil
        lastPosition = nil
    }
}
