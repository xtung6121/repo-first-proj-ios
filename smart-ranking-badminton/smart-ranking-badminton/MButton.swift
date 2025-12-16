import UIKit

@IBDesignable
final class MButton: UIButton {
    
    // MARK: - Closure
    var onTap: (() -> Void)?
    
    // Loading indicator
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .medium)
        indicator.color = .white
        indicator.hidesWhenStopped = true
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }
    
    // MARK: - Setup chung
    private func setupButton() {
        // Style mặc định đẹp
        backgroundColor = .systemBlue
        setTitleColor(.white, for: .normal)
        titleLabel?.font = .systemFont(ofSize: 17, weight: .semibold)
        layer.cornerRadius = 15
        clipsToBounds = true
//        contentEdgeInsets = UIEdgeInsets(top: 12, left: 24, bottom: 12, right: 24)
//        
        // Thêm loading vào giữa
        addSubview(activityIndicator)
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        // Dùng Closure thay vì target/action lằng nhằng
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc private func buttonTapped() {
        onTap?()
    }
    
    // MARK: - Config
    func config(
        title: String,
        backgroundColor: UIColor = .systemBlue,
        titleColor: UIColor = .white,
        font: UIFont = .systemFont(ofSize: 17, weight: .semibold),
        cornerRadius: CGFloat = 15
    ) {
        setTitle(title, for: .normal)
        self.backgroundColor = backgroundColor
        setTitleColor(titleColor, for: .normal)
        titleLabel?.font = font
        layer.cornerRadius = cornerRadius
    }
    
    // MARK: - Loading
    func showLoading(_ isLoading: Bool, titleWhenLoading: String? = nil) {
        isEnabled = !isLoading
        
        if isLoading {
            activityIndicator.startAnimating()
            setTitle(titleWhenLoading, for: .normal)
            alpha = 0.8
        } else {
            activityIndicator.stopAnimating()
            alpha = 1.0
        }
    }
    
    // MARK: - IBInspectable (kéo thả trong Storyboard vẫn thấy đẹp luôn!)
    @IBInspectable var titleText: String = "Button" {
        didSet { setTitle(titleText, for: .normal) }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 15 {
        didSet { layer.cornerRadius = cornerRadius }
    }
    
    @IBInspectable var buttonColor: UIColor = .systemBlue {
        didSet { backgroundColor = buttonColor }
    }
}
