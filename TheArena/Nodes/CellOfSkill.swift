//
//  SkillCell.swift
//  TheArena
//
//  Created by Eugene Krapivenko on 06.09.2021.
//

//extension CellOfSkill {
//    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        guard touches.first != nil, parent != nil else { return }
//        
//        selected = true
//        startPosition = position
//        let _ = self.onMove?(self)
//        
//        let entity = parent?.entity
//        if let skillMoving = entity?.component(ofType: SkillMovingComponent.self) {
//            skillMoving.setMovingSkill(self)
//        }
//    }
//    
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        guard let first = touches.first, let contentNode = parent?.parent else { return }
//        
//        let newPosition = first.location(in: contentNode)
//        if lastPosition == nil {
//            lastPosition = newPosition
//        } else {
//            let xRange = -LobbyElements.contentSize.width/2...LobbyElements.contentSize.width/2
//            let yRange = -LobbyElements.contentSize.height/2...LobbyElements.contentSize.height/2
//            
//            if xRange.contains(newPosition.x) && yRange.contains(newPosition.y) {
//                if let lastPosition = lastPosition {
//                    let dX = lastPosition.x - newPosition.x
//                    let dY = lastPosition.y - newPosition.y
//                    let xPosition = dX > 0 ? position.x - abs(dX) : position.x + abs(dX)
//                    let yPosition = dY > 0 ? position.y - abs(dY) : position.y + abs(dY)
//                    
//                    position = CGPoint(x: xPosition, y: yPosition)
//                    self.lastPosition = newPosition
//                }
//            }
//        }
//    }
//    
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if let startPosition = startPosition {
//            position = startPosition
//        }
//        startPosition = nil
//        lastPosition = nil
//    }
//    
//    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if let startPosition = startPosition {
//            position = startPosition
//        }
//        startPosition = nil
//        lastPosition = nil
//    }
//}
