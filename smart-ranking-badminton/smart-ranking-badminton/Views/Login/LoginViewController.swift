//
//  LoginViewController.swift
//  smart-ranking-badminton
//
//  Created by PRO on 11/28/25.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var lbHeader: UILabel!
    @IBOutlet weak var bgSuperView: UIImageView!
    
    @IBOutlet var textFiledInput: [UITextField]!
    @IBOutlet weak var lbForgotPass: UILabel!
    @IBOutlet weak var btnSignIn: UIButton!
    @IBAction func btnSignIn(_ sender: Any) {
        
//        tại sao ibAction không thực thi đoạn code trong này ?
    
        let rootVC = HomeViewController()
        rootVC.title = "Welcome"
        let navVC = UINavigationController(rootViewController: rootVC)
        
        present(navVC, animated: true)
        
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI() {
        bgSuperView.backgroundColor = .systemBlue
        lbHeader.text = "Sign in"
        
        
        // Handle sign in
        btnSignIn.setTitle("Sign in", for: .normal)
        view.addSubview(btnSignIn)
        btnSignIn.backgroundColor = .systemBlue
        btnSignIn.setTitleColor(.white, for: .normal)
        btnSignIn.layer.cornerRadius = 14
        
        
        
        for textField in textFiledInput {
                    textField.backgroundColor = .white
                    textField.layer.cornerRadius = 14
                    textField.layer.borderWidth = 1
                    textField.layer.borderColor = UIColor.systemGray.cgColor
                    textField.clipsToBounds = true
        
                }
        
        lbForgotPass.text = "Forgot your password ?"
        lbForgotPass.textColor = .black
        lbForgotPass.font = UIFont.systemFont(ofSize: 12, weight: .thin)
    }

}



//import UIKit
//
//class ViewController: UIViewController {
//
//    enum ColorSet: String {
//        case backgroundColor
//        case detailTextColor
//        case mainColor
//        case titleHeaderColor
//
//        var color: UIColor {
//            guard let color = UIColor(named: self.rawValue) else {
//                fatalError("Invalid Color Set name")
//            }
//            return color
//        }
//    }
//
//    @IBOutlet weak var backgroundImageView: UIImageView!
//
//    @IBOutlet weak var labelNavigation: UILabel!
//
//    @IBOutlet weak var labelHeader1: UILabel!
//    @IBOutlet weak var labelHeader2: UILabel!
//
//    @IBOutlet var textFieldInput: [UITextField]!
//    @IBOutlet weak var usernameTextField: UITextField!
//
//    @IBOutlet weak var labelForgotPassword: UILabel!
//    @IBOutlet weak var passwordTextField: UITextField!
//
//    @IBOutlet var lbCollectionFooter: [UILabel]!
//    @IBOutlet weak var lbFooter1: UILabel!
//
//    @IBOutlet weak var lbFooter2: UILabel!
//    @IBOutlet weak var btnSignIn: UIButton!
//
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
////        setupUI()
//        view.backgroundColor = .systemRed
//
//    }
//
//    private func setupUI() {
//
////        backgroundImageView.backgroundColor = ColorSet.backgroundColor.color
////
////        labelNavigation.text = "Sign in"
////        labelNavigation.textColor = ColorSet.titleHeaderColor.color
////        labelNavigation.font = .systemFont(ofSize: 24, weight: .semibold)
////
////        labelHeader1.text = "Welcome Back"
////        labelHeader1.textColor = ColorSet.backgroundColor.color
////        labelHeader1.font = .boldSystemFont(ofSize: 24)
////
////        labelHeader2.text = "Hello there, sign in to continue"
////        labelHeader2.textColor = .black
////        labelHeader2.font = .systemFont(ofSize: 13)
////
////        for textField in textFieldInput {
////            textField.backgroundColor = .white
////            textField.layer.cornerRadius = 14
////            textField.layer.borderWidth = 1
////            textField.layer.borderColor = UIColor.systemGray.cgColor
////            textField.clipsToBounds = true
////
////        }
////
////        usernameTextField.attributedPlaceholder = NSAttributedString(
////            string: "Text input",
////            attributes: [
////                .foregroundColor: UIColor.black,
////                .font: UIFont.systemFont(ofSize: 12, weight: .thin)
////            ]
////        )
////
////        passwordTextField.attributedPlaceholder = NSAttributedString(
////        string: "Password",
////        attributes: [
////            .foregroundColor : UIColor.black,
////            .font: UIFont.systemFont(ofSize: 12, weight: .thin)
////            ]
////        )
////
////
////
////        labelForgotPassword.text = "Forgot your password ?"
////        labelForgotPassword.textColor = .black
////        labelForgotPassword.font = UIFont.systemFont(ofSize: 12, weight: .thin)
////
////
////        btnSignIn.setTitle("Sign in", for: .normal)
////        btnSignIn.setTitle("Signing...", for: .disabled)
////
////        btnSignIn.layer.cornerRadius = 16
////        btnSignIn.clipsToBounds = true
////
////
////        btnSignIn.setTitleColor(.white, for: .normal)
////        btnSignIn.titleLabel?.font = .systemFont(ofSize: 24, weight: .semibold)
////
////
////        for lbFooter in lbCollectionFooter {
////            lbFooter.font = UIFont.systemFont(ofSize: 13)
////        }
////        lbFooter1.text = "Don't have an account?"
////        lbFooter1.textColor = .black
////
////        lbFooter2.text = "Sign Up"
////        lbFooter2.textColor = ColorSet.backgroundColor.color
////        lbFooter2.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
//
//    }
