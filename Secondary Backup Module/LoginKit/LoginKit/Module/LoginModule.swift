//
//  LoginModule.swift
//  LoginKit
//
//  Created by Trevin Wisaksana on 20/11/19.
//  Copyright © 2019 Stockbit. All rights reserved.
//

import UIKit
import ModuleManager

public class LoginModule: LoginModuleManageable {
    public init() {}
    
    public func loginPage() -> UIViewController {
        let bundle = Bundle(for: LoginModule.self)
        let mainStoryboard = UIStoryboard(name: "Login", bundle: bundle)
        let loginViewController = mainStoryboard.instantiateViewController(withIdentifier: "LoginViewController")
        return loginViewController
    }
    
}
