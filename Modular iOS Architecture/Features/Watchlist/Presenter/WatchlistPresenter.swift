//
//  WatchlistPresenter.swift
//  Modular iOS Architecture [SwiftyIDxStockbit]
//
//  Created by Trevin Wisaksana on 09/11/19.
//  Copyright © 2019 Stockbit. All rights reserved.
//

import UIKit

final class WatchlistPresenter {
    
    private var parentController: UIViewController?
    
    init(parent: UIViewController) {
        self.parentController = parent
    }
    
    func presentCompanyProfile(withViewModel viewModel: CompanyProfileViewModel) {
        let companyProfileViewController = CompanyProfileViewController.instantiate(viewModel: viewModel)
        parentController?.present(companyProfileViewController, animated: true, completion: nil)
    }
    
}
