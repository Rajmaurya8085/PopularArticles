//
//  DataModel.swift
//  PopularArticles
//
//  Created by Raj Maurya on 01/03/20.
//  Copyright © 2020 Raj Maurya. All rights reserved.
//

import Foundation

public class DataModel:Codable{
    
    var status:String
    var copyright:String
    var num_results:Int
    var results:[ArticlesData] = [ArticlesData]()
}


public class ArticlesData:Codable{
    let uri:String
    let url:String
    let id:Double
    let asset_id:Double
    let source:String
    let published_date:String
    let updated:String
    let section:String
    let subsection:String
    let nytdsection:String
    let title:String
    let abstract:String
    var byline:String
}

