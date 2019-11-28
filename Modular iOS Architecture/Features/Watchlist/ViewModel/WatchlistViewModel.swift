//
//  WatchlistViewModel.swift
//  Modular iOS Architecture [SwiftyIDxStockbit]
//
//  Created by Trevin Wisaksana on 03/11/19.
//  Copyright © 2019 Stockbit. All rights reserved.
//

import Foundation

extension StockModel: WatchlistViewInterface {}

final class WatchlistViewModel {
    
    init(apiService: WatchlistAPIServiceProtocol) {
        self.watchlistAPIService = apiService
    }
    
    private let watchlistAPIService: WatchlistAPIServiceProtocol?
    
    private var listOfMostActiveStocks: [StockModel] = []
    
    var numberOfMostActiveStocks: Int {
        return listOfMostActiveStocks.count
    }
    
    func mostActiveStock(atIndexPath indexPath: IndexPath) -> StockModel {
        return listOfMostActiveStocks[indexPath.row]
    }
    
    func getWatchlistData(success: @escaping () -> Void, failure: @escaping (String) -> Void) {
        watchlistAPIService?.getMostActiveSymbols(success: { (data) in
            
            do {
                let decoder = JSONDecoder()
                let model = try decoder.decode(WatchlistModel.self, from: data)
                
                self.listOfMostActiveStocks = model.mostActiveStock
                
                success()
                
            } catch let parsingError {
                failure((parsingError as NSError).debugDescription)
            }
            
        }, failure: { (errorMessage) in
            failure(errorMessage)
        })
    }
    
}
