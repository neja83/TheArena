//
//  RatingComponent.swift
//  TheArena
//
//  Created by Eugene Krapivenko on 04.09.2021.
//

import GameplayKit

class RatingComponent: GKComponent {
    
    private var wins: Int = 0
    private var loses: Int = 0
    private var percent: Int {
        if (wins == 0 && loses == 0) { return 0 }
        return (wins / (wins + loses)) * 100
    }
    
    // MARK: - Labels
    var label: SKLabelNode = {
        let statLabel = SKLabelNode(text: "Статистика")
        statLabel.fontSize = 50
        statLabel.fontColor = .cyan
        return statLabel
    }()
    var winsLabel: SKLabelNode =  {
        let label =  SKLabelNode()
        label.fontSize = 40
        return label
    }()
    var losesLabel: SKLabelNode = {
        let label =  SKLabelNode()
        label.fontSize = 40
        return label
    }()
    var percentLabel: SKLabelNode = {
        let label =  SKLabelNode()
        label.fontSize = 40
        return label
    }()
    
    override init() {
        super.init()
        winsLabel.text = String(wins)
        losesLabel.text = String(loses)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didAddToEntity() {
        if let body = entity?.component(ofType: VisualComponent.self)?.node {
            
            let shapeSize = body.frame.size
            
            label.position = CGPoint(x: -shapeSize.width/4, y: shapeSize.height/4)
            label.zPosition = 5
            winsLabel.position = CGPoint(x: -shapeSize.width/4, y: shapeSize.height/4 - 50)
            winsLabel.zPosition = 5
            losesLabel.position = CGPoint(x: -shapeSize.width/4, y: shapeSize.height/4 - 100)
            losesLabel.zPosition = 5
            percentLabel.position = CGPoint(x: -shapeSize.width/4, y: shapeSize.height/4 - 150)
            percentLabel.zPosition = 5
            
            // FIXME: изменить поведение при появление сетевого слоя
            winsLabel.text = "Побед: \(wins)"
            losesLabel.text = "Поражений: \(loses)"
            percentLabel.text = "\(percent) %"
            
            body.addChild(label)
            body.addChild(winsLabel)
            body.addChild(losesLabel)
            body.addChild(percentLabel)
        }
    }
    
}
