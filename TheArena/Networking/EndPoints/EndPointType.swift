//
//  EndPointType.swift
//  TheArena
//
//  Created by Eugene Krapivenko on 27.08.2021.
//

import Foundation

// Описывает ручки на сервере
protocol EndPointType {
    var baseUrl: URL { get }
    var path:    String { get }
    var httpMethod:  HTTPMethod { get }
    var httpTask:    HTTPTask { get }
    var httpHeaders: HTTPHeaders? { get }
}
