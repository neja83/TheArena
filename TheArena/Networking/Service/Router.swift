//
//  Router.swift
//  TheArena
//
//  Created by Eugene Krapivenko on 27.08.2021.
//

import Foundation

class Router<EndPoint: EndPointType>: NetworkRouter {
    private var task: URLSessionTask?
    
    func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion) {
        let session = URLSession.shared
        do {
            let requset = try self.buildRequest(from: route)
            
            task = session.dataTask(with: requset, completionHandler: { data, responce, error in
                completion(data,responce, error)
            })
        } catch {
            completion(nil, nil, error)
        }
        
        self.task?.resume()
    }
    
    func cancel() {
        self.task?.cancel()
    }
    
    fileprivate func buildRequest(from route: EndPoint) throws -> URLRequest {
        var request = URLRequest(url: route.baseUrl.appendingPathComponent(route.path),
                                 cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
                                 timeoutInterval: 10.0)
        
        request.httpMethod = route.httpMethod.rawValue
        
        do {
            switch route.httpTask {
                case .request:
                    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                case .requestWithParameters(let bodyParameters, let urlParameters):
                    
                    try self.configureParameters(bodyParameters: bodyParameters,
                                                 urlParameters: urlParameters,
                                                 request: &request)
                    
                case .requestWithParametersAndHeaders(let bodyParameters, let urlParameters, let headers):
                    
                    self.addAdditionalHeaders(headers, request: &request)
                    try self.configureParameters(bodyParameters: bodyParameters, urlParameters: urlParameters, request: &request)
            }
            return request
        } catch {
            throw error
        }
    }
    
    fileprivate func configureParameters(bodyParameters: Parameters?, urlParameters: Parameters?, request: inout URLRequest) throws {
        do {
            if let bodyParameters = bodyParameters {
                try JSONParameterEncoder.encode(urlRequest: &request, with: bodyParameters)
            }
            if let urlParameters = urlParameters {
                try URLParameterEncoder.encode(urlRequest: &request, with: urlParameters)
            }
        }
        catch{
            throw error
        }
    }
    
    fileprivate func addAdditionalHeaders(_ additionalHeaders: HTTPHeaders?, request: inout URLRequest) {
        guard let headers = additionalHeaders else { return }
        
        for (key, value) in headers {
            request.addValue(value, forHTTPHeaderField: key)
        }
    }
}
