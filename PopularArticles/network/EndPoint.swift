//
//  EndPoint.swift
//  PopularArticles
//
//  Created by Raj Maurya on 01/03/20.
//  Copyright © 2020 Raj Maurya. All rights reserved.
//

import Foundation


public typealias HTTPHeaders = [String: String]

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete  = "DELETE"
}

protocol Endpoint {
    var url: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod {get}
    var httpBody: Data? { get }
    var headers: HTTPHeaders? { get }
}


enum NYArticalAPI {
    case getArtical

}
extension NYArticalAPI: Endpoint {
    
    var url: URL {
        let urlString = (Constants.API.baseURL).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        guard let url = URL(string: urlString ?? "") else {
            fatalError("URL could not be configured.")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .getArtical:
            return ""
        }
    }
    
    var httpMethod: HTTPMethod {
       
            return .get
    }
    
    var httpBody: Data? {
        return nil
    }
    
    var headers: HTTPHeaders? {
            return nil
    }
    
    
}
