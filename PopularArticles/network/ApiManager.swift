//
//  ApiManager.swift
//  PopularArticles
//
//  Created by Raj Maurya on 01/03/20.
//  Copyright © 2020 Raj Maurya. All rights reserved.
//

import Foundation


class ApiManager: APIClient {
    var session: URLSessionProtocol
    
    var task: URLSessionDataTaskProtocol?
    
    init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }
}


protocol updateDataDelegate :class{
    func updateView(isSuccess: Bool, withNewLayout: Bool)
}

class  ListViewModel{
    weak var delegate:updateDataDelegate?
    var apiClient:ApiManager
    var articals:[ArticlesData] = [ArticlesData]()
    init(apiClient:ApiManager) {
        self.apiClient =  apiClient
    }
func callNYArticalAPI(endPoint: Endpoint) {
       
       apiClient.fetch(with: endPoint, decode: { json -> DataModel? in
           guard let contactArray = json as? DataModel else { return nil }
           return contactArray
       }) { [weak self] result in
           DispatchQueue.main.async {
               switch result {
               case .success(let NYArticalResult):
                print("success")
                let articalArray = NYArticalResult.results

                   if articalArray.count < 1{
                       self?.delegate?.updateView(isSuccess: false, withNewLayout: false)
                   }
                   self?.articals += articalArray
                   self?.delegate?.updateView(isSuccess: true, withNewLayout: false)
               case .failure(let error):
                   print("the error \(error)")
                  // self?.delegate?.updateView(isSuccess: false, withNewLayout: false)
               }
           }
       }
   }
    
    
}



class URLProtocolMock: URLProtocol {
    // this dictionary maps URLs to test data
    static var testURLs = [URL?: Data]()

    // say we want to handle all types of request
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }

    // ignore this method; just send back what we were given
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    override func startLoading() {
        // if we have a valid URL…
        if let url = request.url {
            // …and if we have test data for that URL…
            if let data = URLProtocolMock.testURLs[url] {
                // …load it immediately.
                self.client?.urlProtocol(self, didLoad: data)
            }
        }

        // mark that we've finished
        self.client?.urlProtocolDidFinishLoading(self)
    }

    // this method is required but doesn't need to do anything
    override func stopLoading() { }
}
