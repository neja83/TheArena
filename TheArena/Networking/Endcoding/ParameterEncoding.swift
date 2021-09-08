//
//  ParameterEncoding.swift
//  TheArena
//
//  Created by Eugene Krapivenko on 27.08.2021.
//

import Foundation
    
public typealias Parameters = [String:Any]

protocol ParameterEndcoder {
    static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws
}
