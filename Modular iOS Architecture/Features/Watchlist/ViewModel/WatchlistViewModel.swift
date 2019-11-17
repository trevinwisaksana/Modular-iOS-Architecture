//
//  WatchlistViewModel.swift
//  Modular iOS Architecture [SwiftyIDxStockbit]
//
//  Created by Trevin Wisaksana on 03/11/19.
//  Copyright © 2019 Stockbit. All rights reserved.
//

import Foundation

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
    
    func companyProfileViewModel(forIndexPath indexPath: IndexPath) -> CompanyProfileViewModel {
        let data = listOfMostActiveStocks[indexPath.row]
        return CompanyProfileViewModel(companySymbol: data.companySymbol, companyName: data.companyName)
    }
    
    func getWatchlistData(success: @escaping voidCompletionHandler, failure: @escaping errorMessageCompletionHandler) {
        watchlistAPIService.getMostActiveSymbols(success: { (data) in
            
            let mostActiveStock = data["mostActiveStock"].arrayValue
            self.listOfMostActiveStocks = mostActiveStock.compactMap { WatchlistModel(data: $0) }
            
            success()
            
        }, failure: { (errorMessage) in
            failure(errorMessage)
        })
    }
    
}
