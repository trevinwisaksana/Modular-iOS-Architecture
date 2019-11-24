//
//  LoginView.swift
//  Modular iOS Architecture [SwiftyIDxStockbit]
//
//  Created by Trevin Wisaksana on 03/11/19.
//  Copyright © 2019 Stockbit. All rights reserved.
//

import UIKit

protocol LoginViewDelegate: class {
    func loginView(_ loginView: LoginView, didTapLoginButton button: UIButton)
}

final class LoginView: UIView {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    
    private let defaultCornerRadius: CGFloat = 6.0
    private let defaultBorderColor: CGColor = UIColor.lightGray.cgColor
    private let defaultBorderWidth: CGFloat = 0.5
    
    // MARK: - External Properties
    
    weak var delegate: LoginViewDelegate?
    
    // MARK: - Overrides
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        setTextFieldPadding()
        setCornerRadius()
        setBorder()
    }
    
    private func setCornerRadius() {
        loginButton.layer.cornerRadius = defaultCornerRadius
        passwordTextField.layer.cornerRadius = defaultCornerRadius
        usernameTextField.layer.cornerRadius = defaultCornerRadius
    }
    
    private func setBorder() {
        usernameTextField.layer.borderColor = defaultBorderColor
        usernameTextField.layer.borderWidth = defaultBorderWidth
        
        passwordTextField.layer.borderColor = defaultBorderColor
        passwordTextField.layer.borderWidth = defaultBorderWidth
    }
    
    private func setTextFieldPadding() {
        setLeftPadding(forTextField: passwordTextField)
        setLeftPadding(forTextField: usernameTextField)
    }
    
    func setLeftPadding(forTextField textField: UITextField, amount: CGFloat = 20.0) {
        let paddingFrame = CGRect(x: 0, y: 0, width: amount, height: frame.size.height)
        let paddingView = UIView(frame: paddingFrame)
        
        textField.leftView = paddingView
        textField.leftViewMode = .always
    }
    
    // MARK: - IBAction
    
    @IBAction func didTapLoginButton(_ sender: UIButton) {
        delegate?.loginView(self, didTapLoginButton: sender)
    }
    
}
