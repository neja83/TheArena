//
//  NetworkRouter.swift
//  TheArena
//
//  Created by Eugene Krapivenko on 27.08.2021.
//

import Foundation

public typealias NetworkRouterCompletion = (_ data: Data?,_ response: URLResponse?,_ error: Error?)->()

protocol NetworkRouter {
    
    associatedtype EndPoint: EndPointType
    
    func request(_ router: EndPoint, completion: @escaping NetworkRouterCompletion)
    func cancel()
}
