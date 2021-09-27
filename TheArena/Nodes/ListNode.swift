//
//  ListNode.swift
//  TheArena
//
//  Created by Eugene Krapivenko on 08.09.2021.
//

import SpriteKit
import GameplayKit

/// List of Items
class ListNode: SKShapeNode {
  
    var component: GKComponent?
    
    private(set) var list: [CellWithItem] = [] {
        didSet{
            countLabel.text = String("items: \(list.count)")
        }
    }
    private(set) var newCell: Cell?
    private var countLabel: SKLabelNode = SKLabelNode(text: "items: 0")
    
    init(size: CGSize, list: [Item] = []) {
        super.init()
        
        add(items: list)
        
        let rect = CGRect(origin: CGPoint(x: -size.width/2, y: -size.height/2), size: size)
        path = CGPath(rect: rect, transform: .none)
        
        setup(size: rect.size)
    }
    
    func add(items: [Item]) {
        for item in items {
            let cell: Cell = createCell()
            
            put(item: item, in: cell)
        }
    }
    
    /// Setup node
    private func setup(size: CGSize) {
        let countSize = countLabel.frame.size;
        countLabel.position = CGPoint(x: size.width/2 - countSize.width, y: size.height/2 - countSize.height)
        countLabel.fontColor = .white
        countLabel.zPosition = 15
        addChild(countLabel)
    }

    /// Create cell and show it
    private func createCell() -> Cell {
        let body = SKShapeNode(circleOfRadius: LobbyElements.skillRadius + 2)
        body.strokeColor = .green
        body.position = calculatePosition(for: list.count)
        let cell = ListCell(id: Int32.random(in: 1...Int32.max), node: body)
     
        addChild(body)
        return cell
    }
    
    /// Put new item in cell
    private func put(item: Item, in cell: Cell) {
        item.node.position = cell.node.position
        item.node.zPosition = cell.node.zPosition + 1

        list.append(CellWithItem(cell: cell, item: item))
        item.node.removeFromParent()
        addChild(item.node)
    }

    /// Removed cell as node from all nodes
    private func delete(cell: Cell) -> Int? {
        var indexOfCell: Int? = nil
        if let index = list.firstIndex(where: { $0.cell.isEqual(to: cell) }) {
            indexOfCell = index
            list.remove(at: index)
        }
        cell.node.removeAllActions()
        cell.node.removeFromParent()
        cell.node.removeAllChildren()

        return indexOfCell
    }
   
    /// Calculate position for new element
    private func calculatePosition(for count: Int) -> CGPoint {
        let size  = frame.size
        
        let xPosition = -size.width/2 + LobbyElements.skillRadius+2
        let yPosition = size.height/2 - CGFloat(count)*(LobbyElements.skillRadius+2)*2 - LobbyElements.skillRadius
        return CGPoint(x: xPosition, y: yPosition)
    }
    
    /// Update positions for sublist starting from index `from`
    /// - Parameters:
    ///     - from: index of first element in list
    private func updatePositions(from: Int) {
        let shortList = list[from...]
        let diff = list.count - shortList.count
        for (index, item) in shortList.enumerated() {
            let newPosition = calculatePosition(for: diff + index)
            item.cell.node.position = newPosition
            item.item.node.position = newPosition
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension ListNode: ContainingItems {
    
    /// Create new cell for outer component
    func create() {
        let cell = createCell()
        newCell = cell
    }
    
    /// Regestry item as moving item
    func startMoving(item: Item) {
        if let cellWithItem = list.first(where: { $0.item.isEqual(to: item) }) {
            newCell = cellWithItem.cell
        }
    }
    
    /// Delete cell as node from component
    func delete() {
        if let cell = newCell {
            if let index = delete(cell: cell) {
                updatePositions(from: index)
                newCell = nil
            }
        }
    }
    
    /// Get created cell from `newCell` and put elemet in it
    func save(item: Item) {
        if let cell = newCell {
            put(item: item, in: cell)
        }
    }
    
    /// Return back item on position of it cell
    func moveBack(item: Item) {
        if let cellWithItem = list.first(where: { $0.item.isEqual(to: item) }) {
            item.node.position = cellWithItem.cell.node.position
        }
    }
    
    func isEqual(to: ContainingItems) -> Bool {
        guard let node = to as? SKNode else { return false }
        return super.isEqual(to: node)
    }
}
