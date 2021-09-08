//
//  AuthEndPoint.swift
//  TheArena
//
//  Created by Eugene Krapivenko on 27.08.2021.
//

import Foundation

enum NetworkEnviroment {
    case qa
    case production
    case staging
}

public enum AuthApi {
    case auth(login: String, password: String)
}

extension AuthApi: EndPointType {
    var baseUrl: URL {
        guard let url = URL(string: "http://192.168.0.102:8080") else { fatalError() }
        return url
    }
    
    var path: String {
        switch self {
            case .auth: return "/auth"
        }
    }
    
    var httpMethod: HTTPMethod {
        .post
    }
    
    var httpTask: HTTPTask {
        switch self {
        case .auth(let login, let password):
            return .requestWithParameters(bodyParameters: ["login": login, "password": password], urlParameters: nil)
        }
    }
    
    var httpHeaders: HTTPHeaders? {
        nil
    }
    
}
