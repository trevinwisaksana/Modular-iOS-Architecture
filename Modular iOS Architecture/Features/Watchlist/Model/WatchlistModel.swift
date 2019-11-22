//
//  WatchlistModel.swift
//  Modular iOS Architecture [SwiftyIDxStockbit]
//
//  Created by Trevin Wisaksana on 13/11/19.
//  Copyright © 2019 Stockbit. All rights reserved.
//

struct WatchlistModel: Codable {
    var mostActiveStock: [StockModel]
}

struct StockModel: Codable {
    var companySymbol: String
    var companyName: String
    var price: String
    var percentageChange: String

    enum CodingKeys: String, CodingKey {
       case companySymbol = "ticker"
       case companyName
       case price
       case percentageChange = "changesPercentage"
    }
}
