//
//  NetworkComponent.swift
//  TheArena
//
//  Created by Eugene Krapivenko on 04.09.2021.
//

import GameplayKit

protocol Networking {
    typealias Update = ((Any, Error) -> ())
    
    func get<T: GKComponent, E: GKEntity>(type: T.Type, entity: E.Type, completion: @escaping Update)
}

class NerworkComponent: GKComponent, Networking {
    
    private(set) var stack: [Any] = []
    
    func get<T, E>(type: T.Type, entity: E.Type, completion: @escaping Update) where T : GKComponent, E : GKEntity {
        
        
        
    }
    
}
