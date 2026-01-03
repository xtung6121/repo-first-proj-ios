//
//  MButton.swift
//  smart-ranking-badminton
//
//  Created by macmimi on 03/12/25.
//

import UIKit

@IBDesignable
class MButton: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak private var button: UIButton!
    @IBOutlet weak private var loadingIndicator: UIActivityIndicatorView!
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadXib()
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadXib()
        setupViews()
    }
    
    private func loadXib() {
        Bundle.main.loadNibNamed("MButton", owner: self, options: nil)
        
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
        // Style mặc định đẹp như app thật
        button.layer.cornerRadius = 15
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .semibold)
        button.clipsToBounds = true
        
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.medium
        loadingIndicator.stopAnimating()
    }
    
    // MARK: - Public Config Methods
    
    func config(
        title: String,
        backgroundColor: UIColor = .systemBlue,
        titleColor: UIColor = .white,
        font: UIFont = .systemFont(ofSize: 17, weight: .semibold),
        cornerRadius: CGFloat = 15
    ) {
        button.setTitle(title, for: .normal)
        button.backgroundColor = backgroundColor
        button.setTitleColor(titleColor, for: .normal)
        button.titleLabel?.font = font
        button.layer.cornerRadius = cornerRadius
    }
    
    
    func configWithImage(
        title: String,
        image: UIImage?,
        backgroundColor: UIColor = .white,
        titleColor: UIColor = .label,
        borderColor: UIColor = .systemGray3
    ) {
        button.setTitle(title, for: .normal)
        button.setImage(image?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.backgroundColor = backgroundColor
        button.setTitleColor(titleColor, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = borderColor.cgColor
        
        // Căn icon + chữ đẹp
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -12, bottom: 0, right: 12)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: -12)
    }
    
    // Loading state
    func showLoading(_ isLoading: Bool = true) {
        if isLoading {
            button.setTitle("", for: .normal)
            button.isEnabled = false
            loadingIndicator.startAnimating()
        } else {
            button.isEnabled = true
            loadingIndicator.stopAnimating()
        }
    }
    
    // Action (giống UITextField có delegate thì button có closure)
    var onTap: (() -> Void)?
    
    @IBAction private func buttonTapped(_ sender: UIButton) {
        onTap?()
    }
}

// MARK: - Dùng trong ViewController siêu dễ
/*
 let signInButton = MButton()
 signInButton.config(title: "Đăng Nhập")
 signInButton.onTap = {
     print("Đã nhấn Đăng Nhập")
     signInButton.showLoading(true)
 }
 
 let googleButton = MButton()
 googleButton.configWithImage(
     title: " Continue with Google",
     image: UIImage(named: "google_logo"),
     backgroundColor: .white,
     titleColor: .black,
     borderColor: .systemGray
 )
*/
