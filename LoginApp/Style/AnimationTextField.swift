//
//  AnimationTextField.swift
//  LoginApp
//
//  Created by Yamada Shunya on 2019/04/18.
//  Copyright © 2019 Yamada Shunya. All rights reserved.
//

import UIKit

@IBDesignable
class AnimationTextField: UITextField {
    
    // Settings
    @IBInspectable var lineColor: UIColor = .lightGray {
        didSet {
            underLineView.backgroundColor = lineColor
        }
    }
    @IBInspectable var placeholderLabelColor: UIColor = .black {
        didSet {
            placeholderLabel.textColor = placeholderLabelColor
        }
    }
    
    // Views
    private let underLineView = UIView()
    private let placeholderLabel = UILabel()
    
    private var notificationToken: NSObjectProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    deinit {
        if let notificationToken = notificationToken {
            NotificationCenter.default.removeObserver(notificationToken)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        commonInit()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        commonInit()
    }
    
    // テキストの内側の余白
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.textRect(forBounds: bounds)
        textRect.origin.y = self.bounds.height / 2
        return textRect
    }
    
    // 入力中のテキストの内側の余白
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        var editingRect = super.editingRect(forBounds: bounds)
        editingRect.origin.y = self.bounds.height / 2
        return editingRect
    }
    
    private func commonInit() {
        isExclusiveTouch = true
        backgroundColor = .clear
        borderStyle = .none
        contentVerticalAlignment = .top
        
        setupViews()
        setupPlaceholderAnimation()
    }
    
    private func setupViews() {
        // Under line
        underLineView.backgroundColor = lineColor
        underLineView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(underLineView)
        NSLayoutConstraint.activate([
            underLineView.leadingAnchor.constraint(equalTo: leadingAnchor),
            underLineView.trailingAnchor.constraint(equalTo: trailingAnchor),
            underLineView.bottomAnchor.constraint(equalTo: bottomAnchor),
            underLineView.heightAnchor.constraint(equalToConstant: 0.5)
            ])
        
        // Placeholder label
        placeholderLabel.backgroundColor = .clear
        placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
        placeholderLabel.text = ""
        placeholderLabel.textAlignment = .left
        placeholderLabel.textColor = placeholderLabelColor
        placeholderLabel.lineBreakMode = .byTruncatingTail
        placeholderLabel.numberOfLines = 1
        placeholderLabel.font = UIFont.systemFont(ofSize: 12.0)
        addSubview(placeholderLabel)
        NSLayoutConstraint.activate([
            placeholderLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            placeholderLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            placeholderLabel.topAnchor.constraint(equalTo: topAnchor)
            ])
    }
    
    private func setupPlaceholderAnimation() {
        notificationToken = NotificationCenter.default.addObserver(forName: UITextField.textDidChangeNotification,
                                                                   object: self,
                                                                   queue: nil,
                                                                   using: { [weak self] (notification) in
                                                                    guard let placeholderLabel = self?.placeholderLabel else {
                                                                        return
                                                                    }
                                                                    
                                                                    let duration: TimeInterval = 0.2
                                                                    if let text = self?.text, !text.isEmpty {
                                                                        guard let placeholderText = placeholderLabel.text, placeholderText.isEmpty else {
                                                                            return
                                                                        }
                                                                        placeholderLabel.text = self?.placeholder
                                                                        placeholderLabel.setNeedsLayout()
                                                                        placeholderLabel.layoutIfNeeded()
                                                                        
                                                                        let labelHeight = placeholderLabel.bounds.height
                                                                        placeholderLabel.transform = CGAffineTransform(translationX: 0, y: labelHeight)
                                                                        placeholderLabel.alpha = 0
                                                                        
                                                                        UIView.animate(withDuration: duration, delay: 0, options: [], animations: {
                                                                            placeholderLabel.transform = .identity
                                                                            placeholderLabel.alpha = 1
                                                                        })
                                                                    } else {
                                                                        UIView.transition(with: placeholderLabel, duration: duration, options: .transitionCrossDissolve, animations: {
                                                                            placeholderLabel.text = ""
                                                                        })
                                                                    }
        })
    }
}
