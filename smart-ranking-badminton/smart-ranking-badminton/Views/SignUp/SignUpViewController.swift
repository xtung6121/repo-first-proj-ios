//
//  SignUpViewController.swift
//  smart-ranking-badminton
//
//  Created by PRO on 11/28/25.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var superBgImageView: UIImageView!
    @IBOutlet weak var btnNav: UIButton!
    @IBOutlet weak var lbNav: UILabel!
    @IBOutlet weak var firstLbHeader: UILabel!
    @IBOutlet weak var secondLbHeader: UILabel!
    @IBOutlet weak var iiustrationImage: UIImageView!
    @IBOutlet weak var usernameTextField: MTextField!
    @IBOutlet weak var inputTextField: MTextField!
    @IBOutlet weak var passwordTextField: MTextField!
    @IBOutlet weak var firstLbFooter: UILabel!
    @IBOutlet weak var btnSignUp: MButton!
    @IBOutlet weak var btnReadConditions: UIButton!
    @IBOutlet weak var btnChecked: MChecked!
    @IBOutlet weak var btnNavtoSignIn: UIButton!
    @IBOutlet weak var lbTerm: UILabel!
    @IBOutlet weak var btnCheckConditions: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = false
        
        setupHeaderView()
        setupBGColor()
        setupTextFieldView()
        setupViewCheckedTermAndConditions()
        setupViewBtn()
        setupViewLabelFooter()
    }
    
    private func setupHeaderView() {
        firstLbHeader.text = "Welcome to us"
        firstLbHeader.textColor = ColorSet.backgroundColor.color
        firstLbHeader.font = .systemFont(ofSize: 24, weight: .semibold)
        secondLbHeader.text = "Hello there, create New account"
        secondLbHeader.textColor = .black
        secondLbHeader.font = .systemFont(ofSize: 13)
    }
    
    private func setupBGColor() {
        superBgImageView.backgroundColor = ColorSet.backgroundColor.color
    }
    private func setupTextFieldView() {
        usernameTextField.configView(placeHolder: "Name", textColor: .white, isHiddenRightButton: true)
        inputTextField.configView(placeHolder: "Text input", textColor: .white, isHiddenRightButton: true)
        passwordTextField.configView(placeHolder: "Password", textColor: .white, isHiddenRightButton: false)
        passwordTextField.isSecureTextEntry(true)
    }
    
    private func setupViewCheckedTermAndConditions() {
        btnChecked.configView(text: "Our term")
    }
    
    private func setupViewBtn() {
        btnSignUp.config(title: "Sign up")
    }
    
    private func setupViewLabelFooter() {
        firstLbFooter.text = "Have an account?"
        firstLbFooter.textColor = .black
        firstLbFooter.font = .systemFont(ofSize: 13)
        btnNavtoSignIn.setTitle("Sign in", for: .normal)
        btnNavtoSignIn.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
    }
    
    @IBAction func btnSignInDidTap(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
