//
//  GameViewController.swift
//  TheArena
//
//  Created by Eugene Krapivenko on 23.08.2021.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TODO check wich scene need load
        if let scene = GKScene(fileNamed: "LobbyScene"){

            if let sceneNode = scene.rootNode as! LobbyScene? {

                sceneNode.scaleMode = .aspectFill

                if let view = self.view as! SKView? {
                    view.presentScene(sceneNode)
                    
                    view.ignoresSiblingOrder = true
                    view.showsFPS = true
                    view.showsNodeCount = true
                }
            }
        }
    }
}
