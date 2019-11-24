//
//  LoginPresenter.swift
//  Modular iOS Architecture [SwiftyIDxStockbit]
//
//  Created by Trevin Wisaksana on 03/11/19.
//  Copyright © 2019 Stockbit. All rights reserved.
//

import UIKit
import ModuleManager

final class LoginPresenter {
    
    func presentMainPage() {
        guard let watchlistViewController = ModuleManager.shared.module(withType: WatchlistModuleManageable.self)?.watchlistPage() else {
            return
        }
        
        let rootNavigationController = UINavigationController(rootViewController: watchlistViewController)
        
        if let window = UIApplication.shared.delegate?.window {
            window?.rootViewController = rootNavigationController
        }
    }
    
}
