//
//  AlamoFireHelper.swift
//  Final Project
//
//  Created by Luis Padilla  on 3/22/19.
//  Copyright © 2019 Luis Padilla . All rights reserved.
//

import Foundation
import Alamofire

class AlamoFireHelper {
    
    static let timeOut = 30.0
    
    // Parameters es algo ya de firebase
    class func createRequest(parameters : Parameters?, requestPath : String, httpMethod : HTTPMethod) -> URLRequest? {
        guard let requestURL = URL(string : requestPath) else {
            return nil
        }
        var request = URLRequest(url : requestURL)
        request.httpMethod = httpMethod.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.timeoutInterval = AlamoFireHelper.timeOut
        if let parameters = parameters { // useful also in post request
            request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])
        }
        return request
    }
}
