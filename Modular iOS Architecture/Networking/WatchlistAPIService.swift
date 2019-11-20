//
//  WatchlistAPIService.swift
//  Modular iOS Architecture [SwiftyIDxStockbit]
//
//  Created by Trevin Wisaksana on 04/11/19.
//  Copyright © 2019 Stockbit. All rights reserved.
//

import Alamofire
import SwiftyJSON

public final class WatchlistAPIService {
    public init() {}
    
    func getMostActiveSymbols(success: @escaping (JSON) -> Void, failure: @escaping (String) -> Void) {
        let url = WatchlistAPIRouter.getActiveSymbols
        
        Alamofire.request(url).validate().responseJSON { (response) in
            switch response.result {
            case .success(let data):
                let jsonData = JSON(data)
                success(jsonData)
                
            case .failure(let error):
                failure(error.localizedDescription)
            }
        }
    }
    
}
