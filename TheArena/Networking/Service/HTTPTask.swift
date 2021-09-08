//
//  HTTPTask.swift
//  TheArena
//
//  Created by Eugene Krapivenko on 27.08.2021.
//

import Foundation

public typealias HTTPHeaders = [String:String]

enum HTTPTask {
    case request
    
    case requestWithParameters(bodyParameters: Parameters?, urlParameters: Parameters?)
    
    case requestWithParametersAndHeaders(bodyParameters: Parameters?, urlParameters: Parameters?, headers: HTTPHeaders)
}
