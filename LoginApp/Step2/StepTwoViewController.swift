//
//  StepTwoViewController.swift
//  LoginApp
//
//  Created by Yamada Shunya on 2019/04/19.
//  Copyright © 2019 Yamada Shunya. All rights reserved.
//

import UIKit

class StepTwoViewController: UIViewController {
    
    @IBOutlet weak var identifierTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tapLoginButton(_ sender: Any) {
        if let id = identifierTextField.text {
            print("id: \(id)")
        }
        
        if let pass = passwordTextField.text {
            print("pass: \(pass)")
        }
    }
}
