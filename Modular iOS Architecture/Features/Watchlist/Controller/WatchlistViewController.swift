//
//  WatchlistViewController.swift
//  Modular iOS Architecture [SwiftyIDxStockbit]
//
//  Created by Trevin Wisaksana on 03/11/19.
//  Copyright © 2019 Stockbit. All rights reserved.
//

import UIKit

final class WatchlistViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var watchlistView: WatchlistView!
    
    // MARK: - Properties
    
    private let viewModel = WatchlistViewModel(apiService: WatchlistAPIService())
    
    // MARK: - VC Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    private func setup() {
        title = "Watchlist"
        
        watchlistView.delegate = self
        watchlistView.dataSource = self
        
        watchlistView.showLoadingIndicator()
        
        viewModel.getWatchlistData(success: {
            self.watchlistView.reloadData()
            self.watchlistView.hideLoadingIndicator()
        }, failure: { (errorMessage) in
            self.watchlistView.hideLoadingIndicator()
            print(errorMessage)
        })
    }
    
}

// MARK: - WatchlistViewDelegate

extension WatchlistViewController: WatchlistViewDataSource {
    func watchlistView(numberOfInSection section: Int, in view: WatchlistView) -> Int {
        return viewModel.numberOfMostActiveStocks
    }
    
    func watchlistView(_ view: WatchlistView, modelForRowAt indexPath: IndexPath) -> WatchlistCellInterface {
        return viewModel.mostActiveStock(atIndexPath: indexPath)
    }
}

// MARK: - WatchlistViewDelegate

extension WatchlistViewController: WatchlistViewDelegate {
    func watchlistView(_ view: WatchlistView, didSelectRowAt indexPath: IndexPath) {}
}
