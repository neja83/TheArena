//
//  AvatarModelNode.swift
//  TheArena
//
//  Created by Eugene Krapivenko on 27.09.2021.
//

import SpriteKit

class AvatarModelNode: SKShapeNode {
    
    private(set) var list: [CellWithEquipment] = [] {
        didSet{
            countLabel.text = String("items: \(list.count)")
        }
    }
    private(set) var newCell: Cell?
    private var countLabel: SKLabelNode = SKLabelNode(text: "items: 0")
    
    init(size: CGSize) {
        super.init()
        
        let rect = CGRect(origin: CGPoint(x: -size.width/2, y: -size.height/2), size: size)
        path = CGPath(rect: rect, transform: .none)
        
        setup(size: size)
        setupCells()
    }
    
    /// Setup node
    private func setup(size: CGSize) {
        let countSize = countLabel.frame.size;
        countLabel.position = CGPoint(x: size.width/2 - countSize.width, y: size.height/2 - countSize.height)
        countLabel.fontColor = .white
        countLabel.zPosition = zPosition + 5
        addChild(countLabel)
    }
    
    /// Setup cells
    private func setupCells() {
        
        let oneHandCellPosition = CGPoint(x: -120, y: 0)
        let oneHandCell = createCell(position: oneHandCellPosition, type: .oneHand)
        
        let twoHandCell = createCell(position: .zero, type: .twoHands)
        
        let shieldCellPosition = CGPoint(x: 120, y: 0)
        let shieldCell = createCell(position: shieldCellPosition, type: .shield)
        
        add(cells: [oneHandCell, twoHandCell, shieldCell])
    }
    
    private func add(cells: [Cell]) {
        for cell in cells {
            list.append(CellWithEquipment(cell: cell, item: nil))
        }
    }
    
    private func put(item: Item, in cell: Cell) {
        item.node.position = cell.node.position
        item.node.zPosition = cell.node.zPosition + 5
        let cellNode = cell.node as? SKShapeNode
        cellNode?.strokeColor = .green
        
        item.node.removeFromParent()
        addChild(item.node)
        
        if let containerIndex = list.firstIndex(where: { $0.cell.isEqual(to: cell) }) {
            list[containerIndex].item = item
        }
    }
    
    /// Create cell and show it
    private func createCell(position: CGPoint, type: ItemType) -> Cell {
        let body = SKShapeNode(circleOfRadius: LobbyElements.skillRadius + 2)
        body.name = "Cell"
        body.strokeColor = .green
        body.position = position
        body.zPosition = zPosition + 5
        let cell = EquipmentCell(id: Int32.random(in: 1...Int32.max), node: body, type: type)
     
        addChild(body)
        return cell
    }
    
    private func setActive(cell: Cell) {
        let node = cell.node as? SKShapeNode
        node?.strokeColor = .blue
    }
    
    private func setUnactive(cell: Cell) {
        let node = cell.node as? SKShapeNode
        node?.strokeColor = .green
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension AvatarModelNode: ContainingItems {
    
    func create(for item: Item) -> Bool {
        if let container = list.first(where: { $0.cell.type == item.type && $0.item == nil }) {
            setActive(cell: container.cell)
            newCell = container.cell
            
            return true
        }
        return false
    }
    
    func startMoving(item: Item) {
        if let container = list.first(where: { cellWithEquipment in
            if let storeItem = cellWithEquipment.item {
                return storeItem.isEqual(to: item)
            }
            return false
        }) {
            newCell = container.cell
            setActive(cell: container.cell)
        }
    }
    
    func delete() {
        if let cell = newCell {
            setUnactive(cell: cell)
            if var containerIndex = list.firstIndex(where: { $0.cell.isEqual(to: cell) }) {
                list[containerIndex].item = nil
            }
            newCell = nil
        }
    }
    
    func moveBack(item: Item) {
        if let container = list.first(where: { cellWithEquipment in
            if let storeItem = cellWithEquipment.item {
                return storeItem.isEqual(to: item)
            }
            return false
        }) {
            item.node.position = container.cell.node.position
        }
        
        newCell = nil
    }
    
    func save(item: Item) {
        if let cell = newCell {
            put(item: item, in: cell)
        }
        
        newCell = nil
    }
    
    func isEqual(to: ContainingItems) -> Bool {
        guard let node = to as? SKNode else { return false }
        return super.isEqual(to: node)
    }
}

struct CellWithEquipment {
    var cell: Cell
    var item: Item?
}
