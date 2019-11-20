//
//  WatchlistModel.swift
//  Modular iOS Architecture [SwiftyIDxStockbit]
//
//  Created by Trevin Wisaksana on 13/11/19.
//  Copyright © 2019 Stockbit. All rights reserved.
//

import SwiftyJSON

struct WatchlistModel {
    
    var companySymbol: String = ""
    var companyName: String = ""
    
    var price: String = ""
    var percentageChange: String = ""
    
    init(data: JSON) {
        companySymbol = data["ticker"].stringValue
        companyName = data["companyName"].stringValue
        
        price = data["price"].stringValue
        
        percentageChange = data["changesPercentage"].stringValue
        percentageChange = percentageChange.replacingOccurrences(of: "(", with: "")
        percentageChange = percentageChange.replacingOccurrences(of: ")", with: "")
    }
    
}
