//
//  EndPoints.swift
//  Clase 6
//
//  Created by Luis Padilla  on 3/2/19.
//  Copyright © 2019 Luis Padilla . All rights reserved.
//

import Foundation

struct API {
    static let baseUrl = "http://version1.api.memegenerator.net//Generators_Search?1="
    static let pageIndex = "&pageIndex=0&pageSize=20&apiKey=demo"
}

struct EndPoints {
    static func getMemesUrl(criteria : String) -> String {
        return "\(API.baseUrl)\(criteria)\(API.pageIndex)"
    }
}
