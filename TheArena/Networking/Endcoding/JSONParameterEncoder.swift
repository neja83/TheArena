//
//  JSONParameterEncoder.swift
//  TheArena
//
//  Created by Eugene Krapivenko on 27.08.2021.
//

import Foundation

class JSONParameterEncoder: ParameterEndcoder {
    static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws {
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            urlRequest.httpBody = jsonData
            
            if (urlRequest.value(forHTTPHeaderField: "Content-Type") == nil) {
                urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            }
        } catch {
            throw NetworkError.encodingFailed
        }
    }
}
