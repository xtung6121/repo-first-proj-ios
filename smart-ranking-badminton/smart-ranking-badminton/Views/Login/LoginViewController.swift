//
//  LoginViewController.swift
//  smart-ranking-badminton
//
//  Created by PRO on 11/28/25.
//

import UIKit

class LoginViewController: UIViewController {
    
    enum ColorSet: String {
        case backgroundColor
        case titleHeaderColor
        
        var color: UIColor {
                   guard let color = UIColor(named: self.rawValue) else {
                       fatalError("Invalid Color Set name")
                   }
                   return color
        }
    }
    

    @IBOutlet weak var lbHeader: UILabel!
    @IBOutlet weak var bgSuperView: UIImageView!
    @IBOutlet weak var lbHeaderFirst: UILabel!
    @IBOutlet weak var lbHeaderSecond: UILabel!
    @IBOutlet var textFiledInput: [UITextField]!
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var btnForgotPassword: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var btnSignIn: UIButton!
    
    @IBOutlet weak var lbFooterFirst: UILabel!

    @IBOutlet weak var btnFooter: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupColorbgSuperView()
        setupHeaderStyle()
        setupLabelTitleHeader()
        styleAllTextFields()
        configureIndividualTextFields()
        setupBtnForgotPasswordStyle()
        setupBtnSignInStyle()
        setupFooterStyle()
        
    }
    
    private func setupColorbgSuperView() {
        bgSuperView.backgroundColor = ColorSet.backgroundColor.color
    }
    
    private func setupHeaderStyle() {
        lbHeader.text = "Sign in"
        lbHeader.textColor = ColorSet.titleHeaderColor.color
        lbHeader.font = .systemFont(ofSize: 24, weight: .semibold)
    }
    
    private func setupLabelTitleHeader() {
        lbHeaderFirst.text = "Welcome Back"
        lbHeaderFirst.textColor = ColorSet.backgroundColor.color
        lbHeaderFirst.font = .systemFont(ofSize: 24, weight: .semibold)
        
        
        lbHeaderSecond.text = "Hello there, sign in to continue"
        lbHeaderSecond.textColor = .black
        lbHeaderSecond.font = .systemFont(ofSize: 13)
        
    }
    
    private func styleAllTextFields() {
        for textField in textFiledInput {
            textField.backgroundColor = .white
                    textField.layer.cornerRadius = 14
                    textField.layer.borderWidth = 1
                    textField.layer.borderColor = UIColor.systemGray.cgColor
                    textField.clipsToBounds = true
            
        
                }
        
    }
    
    private func configureIndividualTextFields() {
//          let imageicon = UIImageView()
        
        // style
            let usernamePlaceholder = NSAttributedString(
                string: "Text input",
                attributes: [
                    .foregroundColor: UIColor.black,
                    .font: UIFont.systemFont(ofSize: 12, weight: .thin)
                ]
            )
            usernameTextField.attributedPlaceholder = usernamePlaceholder
            
            // Password field
            let passwordPlaceholder = NSAttributedString(
                string: "Password",
                attributes: [
                    .foregroundColor: UIColor.black.withAlphaComponent(0.8),
                    .font: UIFont.systemFont(ofSize: 12, weight: .thin)
                ]
            )
            passwordTextField.attributedPlaceholder = passwordPlaceholder
        
        
        // btn show password

        
        }
    
    private func setupBtnForgotPasswordStyle() {
        btnForgotPassword.setTitle("Forgot your password?", for: .normal)
            btnForgotPassword.setTitleColor(.black, for: .normal)
            btnForgotPassword.titleLabel?.font = UIFont.systemFont(ofSize: 8, weight: .thin)
    }
    
    
    
    private func setupBtnSignInStyle() {
        lbHeader.text = "Sign in"
        // Handle sign in
        btnSignIn.setTitle("Sign in", for: .normal)
        btnSignIn.backgroundColor = ColorSet.backgroundColor.color
        btnSignIn.setTitleColor(.white, for: .normal)
        btnSignIn.layer.cornerRadius = 14
    }
    
    private func setupFooterStyle(){
        lbFooterFirst.text = "Don't have an account?"
        lbFooterFirst.textColor = .black
        lbFooterFirst.font = .systemFont(ofSize: 12, weight: .semibold)
        
        
        btnFooter.setTitle("Sign up", for: .normal)
        btnSignIn.titleLabel?.textColor = ColorSet.backgroundColor.color
        
    }
    
    
    
    
    
    
    
    
    
    
    @IBAction func btnSignInDidTap(_ sender: Any) {
        self.navigationController?.pushViewController(HomeViewController(), animated: true)
    }
    
    @IBAction func btnSignUpDidTap(_ sender: Any) {
        
        self.navigationController?.pushViewController(SignUpViewController(), animated: true)
    }
    
    
    

}


