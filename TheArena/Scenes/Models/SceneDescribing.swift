//
//  EntityDescribing.swift
//  TheArena
//
//  Created by Eugene Krapivenko on 02.09.2021.
//

import GameplayKit

/// Описание сцены для статической генерации сущностей для нее
protocol SceneDescribing {
    
    var scene: SKScene { get }
    var type:  SceneType { get }
    
}
