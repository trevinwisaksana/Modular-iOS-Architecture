//
//  LoginViewController.swift
//  Modular iOS Architecture [SwiftyIDxStockbit]
//
//  Created by Trevin Wisaksana on 03/11/19.
//  Copyright © 2019 Stockbit. All rights reserved.
//

import UIKit

public final class LoginViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var loginView: LoginView!
    
    // MARK: - Properties
    
    private let presenter = LoginPresenter()
    private let viewModel = LoginViewModel()
    
    // MARK: - VC Lifecycle
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        loginView.delegate = self
        
        title = "Login"
    }
    
}

// MARK: - LoginViewDelegate

extension LoginViewController: LoginViewDelegate {
    func loginView(_ loginView: LoginView, didTapLoginButton button: UIButton) {
        presenter.presentMainPage()
    }
}
