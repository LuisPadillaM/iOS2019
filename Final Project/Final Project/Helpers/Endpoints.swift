//
//  Endpoints.swift
//  Final Project
//
//  Created by Luis Padilla  on 3/22/19.
//  Copyright © 2019 Luis Padilla . All rights reserved.
//

import Foundation

struct API {
    // http://version1.api.memegenerator.net//Generators_Search?q=happy&pageIndex=0&pageSize=20&apiKey=demo
    static let baseUrl = "http://version1.api.memegenerator.net//Generators_Search?"
    static let pageIndex = "pageIndex=0&apiKey=demo"
}

struct EndPoints {
    static func getMemesUrl(configuration : [String : Int]) -> String {
        let rows = configuration["rows"] ?? 0
        let columns = configuration["columns"] ?? 0
        let quantity = "&pageSize=\(rows * columns)"
        return "\(API.baseUrl)\(API.pageIndex)\(quantity)"
    }
}
