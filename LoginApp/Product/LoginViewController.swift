//
//  LoginViewController.swift
//  LoginApp
//
//  Created by Yamada Shunya on 2019/04/18.
//  Copyright © 2019 Yamada Shunya. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    // IBOutlet
    @IBOutlet weak var identifierTextField: AnimationTextField!
    @IBOutlet weak var passwordTextField: AnimationTextField!
    
    // ログイン情報
    private let loginId: String = "id"
    private let loginPassword: String = "pass"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextFields()
    }
    
    // ログインボタンをタップした時に呼ばれる関数
    @IBAction func tapLoginButton(_ sender: Any) {
        checkTextFields()
    }
}

// UI
extension LoginViewController {
    
    // テキストフィールドから通知を受け取るために delegate を設定
    func setupTextFields() {
        identifierTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    /// テキストフィールドに入力された値が正しいか確認する関数
    func checkTextFields() {
        // TextField の text をアンラップして取り出し
        guard let id = identifierTextField.text, let pass = passwordTextField.text else {
            return
        }
        if id == loginId && pass == loginPassword {
            print("ログイン成功")
        }
    }
}

// TextField delegate, touchesBegan
extension LoginViewController: UITextFieldDelegate {
    
    // キーボードの Return キーを押すと次のテキストフィールドに移動する
    // なければキーボードが閉じるだけ
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        if let nextTextField = self.view.viewWithTag(textField.tag + 1) {
            nextTextField.becomeFirstResponder()
        }
        return true
    }
    
    // テキストフィールド以外の部分をタップするとキーボードが閉じる
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
