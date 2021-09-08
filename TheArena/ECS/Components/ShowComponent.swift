//
//  ShowComponent.swift
//  TheArena
//
//  Created by Eugene Krapivenko on 04.09.2021.
//

import GameplayKit

class ShowComponent: GKComponent {
    
    private(set) var show: Bool
    
    init(show: Bool = true) {
        self.show = show
        super.init()
    }
    
    func setShow(value: Bool) {
        self.show = value
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
