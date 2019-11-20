//
//  WatchlistModule.swift
//  WatchlistKit
//
//  Created by Trevin Wisaksana on 20/11/19.
//  Copyright © 2019 Stockbit. All rights reserved.
//

import UIKit
import ModuleManager

public class WatchlistModule: WatchlistModuleManageable {
    public init() {}
    
    public func watchlistPage() -> UIViewController {
        let bundle = Bundle(for: WatchlistModule.self)
        let mainStoryboard = UIStoryboard(name: "Watchlist", bundle: bundle)
        let watchlistViewController = mainStoryboard.instantiateViewController(withIdentifier: "WatchlistViewController")
        return watchlistViewController
    }
    
}
