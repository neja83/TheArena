//
//  NetworkManager.swift
//  TheArena
//
//  Created by Eugene Krapivenko on 28.08.2021.
//

import Foundation

struct NetworkManager {
    static let enviroment: NetworkEnviroment = .production
    private let router = Router<AuthApi>()
}

enum NetworkResponse: String {
    case success
    case failed = "Network ruquest failed."
}

enum Result<String> {
    case success
    case failure(String)
}

func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String> {
    switch response.statusCode {
    case 200...299: return .success
    case 401...600: return .failure(NetworkResponse.failed.rawValue)
    default:
        return .failure(NetworkResponse.failed.rawValue)
    }
}

func getAuth(login: String, password: String, completion: @escaping (_ message: AuthResponse?, _ error: String?) ->()) {
    
    Router.init().request(AuthApi.auth(login: login, password: password)) { data, response, error in
        
        if error != nil {
            completion(nil, "Network error")
        }
        
        if let response = response as? HTTPURLResponse {
            
            let result = handleNetworkResponse(response)
            
            switch result {
                case .success:
                    guard let responseData = data else { completion(nil, "Not data"); return}
                    
                    do {
                        let apiResponse = try JSONDecoder().decode(AuthResponse.self, from: responseData)
                        completion(apiResponse, nil)
                    } catch {
                        completion(nil, "Can not parse server response")
                    }
                case .failure(let error):
                    completion(nil, error)
            }
        }
    }
}
