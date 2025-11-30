import UIKit

class ProfileViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        view.backgroundColor = .systemBackground
        
        let logoutButton = UIButton(type: .system)
        logoutButton.setTitle("Đăng xuất", for: .normal)
        logoutButton.titleLabel?.font = .boldSystemFont(ofSize: 18)
        logoutButton.addTarget(self, action: #selector(logoutTapped), for: .touchUpInside)
        
        view.addSubview(logoutButton)
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
//            logoutButton.centerXAnchor.constraint(equalTo: view.centerAnchor),
            logoutButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc private func logoutTapped() {
        let alert = UIAlertController(title: "Đăng xuất", message: "Bạn có chắc chắn?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Có", style: .destructive) { _ in
            AppFlowController.shared.logout()
        })
        alert.addAction(UIAlertAction(title: "Hủy", style: .cancel))
        self.present(alert, animated: true)
    }
}
