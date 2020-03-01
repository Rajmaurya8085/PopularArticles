//
//  PopularArticlesTests.swift
//  PopularArticlesTests
//
//  Created by Raj Maurya on 01/03/20.
//  Copyright © 2020 Raj Maurya. All rights reserved.
//

import XCTest
@testable import PopularArticles

class PopularArticlesTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    
    func testGeneratedApiURL(){
        
        let url  =  URL(string: "https://api.nytimes.com/svc/mostpopular/v2/viewed/30.json?api-key=mLGhyaOF5saTobI5rtXAajF6AUq6pJNY")
        XCTAssertEqual(NYArticalAPI.getArtical.url,url)
    }
    
    func testRequestResponseSuccess(){
        
        
         let expectation = self.expectation(description: "Data request should succeed")
            URLSession.shared.dataTask(with: NYArticalAPI.getArtical.url) { (data, _, _) in

                guard let data = data, let _ = (try? JSONSerialization.jsonObject(with: data, options: [])) as? [String: Any] else {
                    XCTFail("Wrong data response")
                    expectation.fulfill()
                    return
                }
                expectation.fulfill()
            }.resume()
            
            waitForExpectations(timeout: 10.0, handler: nil)
    }
    
    
    
    func textResponseDecoder(){
        let expectation = self.expectation(description: "Data request should succeed")
                   URLSession.shared.dataTask(with: NYArticalAPI.getArtical.url) { (data, _, _) in

                    guard let data = data, let _ = (try? JSONSerialization.jsonObject(with: data, options: [])) as? [String: Any] else {
                           XCTFail("Wrong data response")
                           expectation.fulfill()
                           return
                       }
                    do {
                         let response =   try JSONDecoder.init().decode(DataModel.self, from: data)
                        if response.results.count > 0{
                        expectation.fulfill()
                        }
                        else{
                            XCTFail("No Artical Found ")
                                                     
                        }
                            
                    }
                    catch let dataParsingError {
                        XCTFail(dataParsingError.localizedDescription)
                    }
                   
    }.resume()
                   
                   waitForExpectations(timeout: 10.0, handler: nil)
    }
    
    func testGeTY(){
     

        
        let url = URL(string: "https://www.apple.com/newsroom/rss-feed.rss")

        // attach that to some fixed data in our protocol handler
        URLProtocolMock.testURLs = [url: Data("Hacking with Swift!".utf8)]

        // now set up a configuration to use our mock
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [URLProtocolMock.self]

        // and create the URLSession from that
        let session = URLSession(configuration: config)
               let apiManager = ApiManager(session: session)
               let apiRespository = ListViewModel(apiClient:apiManager)
               apiRespository.apiClient.session = session
        
        
       
    }
    


    
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    

}
