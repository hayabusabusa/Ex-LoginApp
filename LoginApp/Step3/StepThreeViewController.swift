//
//  StepThreeViewController.swift
//  LoginApp
//
//  Created by Yamada Shunya on 2019/04/19.
//  Copyright © 2019 Yamada Shunya. All rights reserved.
//

import UIKit

class StepThreeViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var identifierTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private let loginId: String = "id"
    private let loginPassword: String = "pass"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextFields()
    }
    
    @IBAction func tapLoginButton(_ sender: Any) {
        if let id = identifierTextField.text, let pass = passwordTextField.text {
            if id == loginId && pass == loginPassword {
                print("ログイン成功")
            }
        }
    }
    
    func setupTextFields() {
        identifierTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
