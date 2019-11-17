//
//  LoginPresenter.swift
//  Modular iOS Architecture [SwiftyIDxStockbit]
//
//  Created by Trevin Wisaksana on 03/11/19.
//  Copyright © 2019 Stockbit. All rights reserved.
//

import UIKit

final class LoginPresenter {
    
    func presentMainPage() {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let watchlistViewController = mainStoryboard.instantiateViewController(withIdentifier: "WatchlistViewController")
        
        let rootNavigationController = UINavigationController(rootViewController: watchlistViewController)
        
        if let window = UIApplication.shared.delegate?.window {
            window?.rootViewController = rootNavigationController
        }
    }
    
}
