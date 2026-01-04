//
//  MTextField.swift
//  smart-ranking-badminton
//
//  Created by macmimi on 30/11/25.
//

import UIKit

class MTextField: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak private var containerView: UIView!
    @IBOutlet weak private var textField: UITextField!
    @IBOutlet weak private var rightButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadXib()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadXib()
        setupViews()
    }
    
    private func loadXib() {
        Bundle.main.loadNibNamed("MTextField", owner: self, options: nil)
        overrideUserInterfaceStyle = .light
        addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func setupViews() {
        contentView.backgroundColor = .clear
        containerView.layer.cornerRadius = 15
        containerView.layer.borderWidth = 0.4
        containerView.layer.borderColor = UIColor.black.cgColor
        containerView.clipsToBounds = true
        containerView.backgroundColor = .clear
    }
    
    func configView(text: String = "",
                    placeHolder: String,
                    textColor: UIColor = .black,
                    font: UIFont = .systemFont(ofSize: 13),
                    isHiddenRightButton: Bool = true) {
        textField.text = text
        textField.placeholder = placeHolder
        textField.textColor = textColor
        textField.font = font
        rightButton.isHidden = isHiddenRightButton
    }
    
    func isSecureTextEntry(_ isSecureTextEntry: Bool) {
        textField.isSecureTextEntry = isSecureTextEntry
    }
}
