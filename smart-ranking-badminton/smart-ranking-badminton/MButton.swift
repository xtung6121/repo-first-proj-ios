//
//  MButton.swift
//  smart-ranking-badminton
//
//  Created by macmimi on 03/12/25.
//

import UIKit

@IBDesignable
class MButton: UIView {
    
    // MARK: - Outlets
    @IBOutlet private var contentView: UIView!
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var buttonSignIn: UIButton!
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        loadXib()
        setupViews()
    }
    
    // MARK: - Load XIB
    private func loadXib() {
        let bundle = Bundle(for: type(of: self))
        bundle.loadNibNamed("MButton", owner: self, options: nil)
        
        addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    // MARK: - Setup Default Style
    private func setupViews() {
        guard buttonSignIn != nil else { return }
        contentView.backgroundColor = .clear
        containerView.layer.cornerRadius = 15
        containerView.clipsToBounds = true
        containerView.backgroundColor = .clear
        
        buttonSignIn.layer.cornerRadius = 15
        buttonSignIn.backgroundColor = .systemBlue
        buttonSignIn.setTitleColor(.white, for: .normal)
        buttonSignIn.titleLabel?.font = .systemFont(ofSize: 17, weight: .semibold)
        buttonSignIn.clipsToBounds = true

    }
    
    // MARK: - Public Config
    func config(
        title: String,
        backgroundColor: UIColor = .systemBlue,
        titleColor: UIColor = .white,
        font: UIFont = .systemFont(ofSize: 17, weight: .semibold),
        cornerRadius: CGFloat = 15
    ) {
        buttonSignIn.setTitle(title, for: .normal)
        buttonSignIn.backgroundColor = backgroundColor
        buttonSignIn.setTitleColor(titleColor, for: .normal)
        buttonSignIn.titleLabel?.font = font
        buttonSignIn.layer.cornerRadius = cornerRadius
        containerView.layer.cornerRadius = cornerRadius
    }
    
    
    // MARK: - Action
    var onTap: (() -> Void)?
    
    @IBAction private func buttonTapped(_ sender: UIButton) {
        onTap?()
    }
}
