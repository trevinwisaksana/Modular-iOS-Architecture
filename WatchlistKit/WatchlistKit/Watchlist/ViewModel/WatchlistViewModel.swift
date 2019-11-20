//
//  WatchlistViewModel.swift
//  Modular iOS Architecture [SwiftyIDxStockbit]
//
//  Created by Trevin Wisaksana on 03/11/19.
//  Copyright © 2019 Stockbit. All rights reserved.
//

import NetworkingKit

extension WatchlistModel: WatchlistViewInterface {}

final class WatchlistViewModel {
    
    private let watchlistAPIService = WatchlistAPIService()
    
    private var listOfMostActiveStocks: [WatchlistModel] = []
    
    var numberOfMostActiveStocks: Int {
        return listOfMostActiveStocks.count
    }
    
    func mostActiveStock(atIndexPath indexPath: IndexPath) -> WatchlistModel {
        return listOfMostActiveStocks[indexPath.row]
    }
    
    func getWatchlistData(success: @escaping () -> Void, failure: @escaping (String) -> Void) {
        watchlistAPIService.getMostActiveSymbols(success: { (data) in
            
            let mostActiveStock = data["mostActiveStock"].arrayValue
            self.listOfMostActiveStocks = mostActiveStock.compactMap { WatchlistModel(data: $0) }
            
            success()
            
        }, failure: { (errorMessage) in
            failure(errorMessage)
        })
    }
    
}
