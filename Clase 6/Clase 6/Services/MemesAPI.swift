//
//  MemesAPI.swift
//  Clase 6
//
//  Created by Luis Padilla  on 3/2/19.
//  Copyright © 2019 Luis Padilla . All rights reserved.
//

import UIKit
import Alamofire

class MemesAPI: MemeStoreProtocol {
    func fetchMemes(searchCriteria: String, completionHandler: @escaping ([Meme]?, ServiceError?) -> Void) {
        guard let isNetworkReachable = NetworkReachabilityManager()?.isReachable else {
            completionHandler(nil, ServiceError.unknown) // there's an error initializing alamo or something like that
            return
        }
        if !isNetworkReachable {
            completionHandler(nil, ServiceError.internet) // no internet
        }
        else {
            makeFetchMemesApiCall(searchCriteria: searchCriteria, completionHandler: completionHandler)
        }
    }
    
    private func makeFetchMemesApiCall(searchCriteria : String, completionHandler : @escaping([Meme]?, ServiceError?) -> Void) {
        let requestPath = EndPoints.getMemesUrl(criteria: searchCriteria)
        if let request = AlamoFireHelper.createRequest(parameters: nil, requestPath: requestPath, httpMethod: .get) {
            Alamofire.request(request).responseJSON { (response) in
                if let jsonData = response.result.value as? [String : Any], let memes = jsonData[APIKeys.Main.result] as? [[String : Any]] {
                    completionHandler(memes.map({Meme.init(dictionary : $0)}), nil)
                } else {
                      completionHandler(nil, ServiceError.wrongAnswer)
                }
           
            }
        } else {
            completionHandler(nil, ServiceError.badUrl)
        }
    }

}
