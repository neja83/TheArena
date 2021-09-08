//
//  TabsStateComponent.swift
//  TheArena
//
//  Created by Eugene Krapivenko on 03.09.2021.
//

import GameplayKit


class TabsStateComponent: GKComponent {
    
    var contents: [TabButton: GKEntity] = [:]
    
    var selected: TabButton = .stats
    
    var newState: TabButton? = nil
    
}
