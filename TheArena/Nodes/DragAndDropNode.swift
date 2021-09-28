//
//  DragAndDropNode.swift
//  TheArena
//
//  Created by Eugene Krapivenko on 14.09.2021.
//

import SpriteKit

class DragAndDropNode: SKSpriteNode {
    
    var parentNode: ContainingItems?
    var targetNode: ContainingItems?
    var movingItem: Item?
    
    init(texture: SKTexture) {
        super.init(texture: texture, color: .clear, size: texture.size())
        name = "DragAndDropNode"
    }
    
    private func clear() {
        targetNode = nil
        parentNode = nil
        movingItem = nil
    }
    
    private func start() {
        entity?.component(ofType: MovingComponent.self)?.startMoving()
    }
    
    private func stop() {
        entity?.component(ofType: MovingComponent.self)?.stopMoving()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DragAndDropNode {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let first = touches.first else { return }
        
        let nodes = nodes(at: first.location(in: self))
        
        for node in nodes {
            if let itemNode = node as? ItemNode, movingItem == nil {
                movingItem = itemNode.item
            }
            if let parentNode = node as? ContainingItems {
                self.parentNode = parentNode
            }
        }
        
        if let movingItem = self.movingItem, let parentNode = self.parentNode {
            parentNode.startMoving(item: movingItem)
            start()
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let first = touches.first, let movingItem = movingItem, let parentNode = self.parentNode else { return }

        let nodes = nodes(at: first.location(in: self))
        
        var changedNode: Bool = true
        
        for node in nodes {
            if let containerNode = node as? ContainingItems, !containerNode.isEqual(to: parentNode) {

                // first inter in container
                if targetNode == nil {
                    targetNode = containerNode
                    targetNode?.create(for: movingItem)
                    changedNode = false
                } else if (targetNode?.isEqual(to: containerNode)) != nil {
                    changedNode = false
                }
            }


        }
        
        if changedNode {
            targetNode?.delete()
            targetNode = nil
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let _ = touches.first, let movingItem =  movingItem else { return }

        if let targetNode = self.targetNode {
            targetNode.save(item: movingItem)
            parentNode?.delete()
        } else {
            parentNode?.moveBack(item: movingItem)
        }
        
        stop()
        clear()
    }
    
}
