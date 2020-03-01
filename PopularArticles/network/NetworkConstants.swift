//
//  NetworkConstants.swift
//  PopularArticles
//
//  Created by Raj Maurya on 01/03/20.
//  Copyright © 2020 Raj Maurya. All rights reserved.
//

import Foundation


struct Constants {
    
    struct API {
        static let baseURL = "https://api.nytimes.com/svc/mostpopular/v2/viewed/30.json?api-key=mLGhyaOF5saTobI5rtXAajF6AUq6pJNY"
        static let timeout: TimeInterval = 60.0
    }
}

