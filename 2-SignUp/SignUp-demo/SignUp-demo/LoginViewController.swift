//
//  ViewController.swift
//  SignUp-demo
//
//  Created by Sanghun Park on 2022/02/15.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: - Properties
    
    // MARK: IBOutlets
    @IBOutlet weak var titleImageView: UIImageView!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwdTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.addViewWithCode()
        self.addKeyboardNotification()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapView))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        /*
        if UserInformation.shared.username != nil {
            self.idTextField.text = UserInformation.shared.username
        }
        */
        
        if let username: String = UserInformation.shared.username {
            self.idTextField.text = username
        }
        else {
            self.idTextField.text = ""
        }
    }


    // MARK: - Methods
    
    // MARK: Custom Methods
    func addKeyboardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        self.view.frame.origin.y -= 100
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        self.view.frame.origin.y += 100
    }

    
    // MARK: IBActions
    @IBAction func touchUpSignUpButton() {
        let rootVC = SignUpFirstViewController()
        let navVC = UINavigationController(rootViewController: rootVC)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true, completion: nil)
    }
    
    @IBAction func tapView(_ sender: Any) {
        view.endEditing(true)
    }
    
    // MARK: View with code
    func addViewWithCode() {
        self.addTitleImageView()
        self.addIdTextField()
        self.addPwdTextField()
        self.addSignInButton()
        self.addSignUpButton()
    }
    
    func addTitleImageView() {
        let imageView = UIImageView(image: UIImage(named: "apple"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(imageView)
        
        let centerX: NSLayoutConstraint = imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        let centerY: NSLayoutConstraint = NSLayoutConstraint(item: imageView, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 0.8, constant: 0)
        let width: NSLayoutConstraint = imageView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.6)
        let ratio: NSLayoutConstraint = imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1)
        
        centerX.isActive = true
        centerY.isActive = true
        width.isActive = true
        ratio.isActive = true
        
        self.titleImageView = imageView
    }
    
    func addIdTextField() {
        let textField = UITextField(frame: CGRect(x: 0, y: 0, width: 300, height: 30))
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(textField)
        
        textField.textContentType = .username
        textField.textAlignment = .left
        textField.placeholder = "ID"
        textField.autocapitalizationType = .none
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.backgroundColor = UIColor.white
        textField.textColor = UIColor.black
        
        let centerX: NSLayoutConstraint = textField.centerXAnchor.constraint(equalTo: self.titleImageView.centerXAnchor)
        let top: NSLayoutConstraint = textField.topAnchor.constraint(equalTo: self.titleImageView.bottomAnchor, constant: 8)
        let left: NSLayoutConstraint = textField.leftAnchor.constraint(equalTo: self.titleImageView.leftAnchor, constant: 5)
        
        centerX.isActive = true
        top.isActive = true
        left.isActive = true
        
        self.idTextField = textField
    }
    
    func addPwdTextField() {
        let textField = UITextField(frame: CGRect(x: 0, y: 0, width: 300, height: 30))
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(textField)
        
        textField.textContentType = .password
        textField.textAlignment = .left
        textField.isSecureTextEntry = true
        textField.placeholder = "Password"
        textField.autocapitalizationType = .none
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.backgroundColor = UIColor.white
        textField.textColor = UIColor.black
        
        let centerX: NSLayoutConstraint = textField.centerXAnchor.constraint(equalTo: self.titleImageView.centerXAnchor)
        let top: NSLayoutConstraint = textField.topAnchor.constraint(equalTo: self.idTextField.bottomAnchor, constant: 5)
        let left: NSLayoutConstraint = textField.leftAnchor.constraint(equalTo: self.titleImageView.leftAnchor, constant: 5)
        
        centerX.isActive = true
        top.isActive = true
        left.isActive = true
        
        self.pwdTextField = textField
    }
    
    func addSignInButton() {
        let button = UIButton(type: UIButton.ButtonType.custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(button)
        
        button.setTitle("Sign In", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        
        let top: NSLayoutConstraint = button.topAnchor.constraint(equalTo: self.pwdTextField.bottomAnchor, constant: 5)
        let left: NSLayoutConstraint = button.leftAnchor.constraint(equalTo: self.titleImageView.leftAnchor, constant: 20)
        
        top.isActive = true
        left.isActive = true
        
        self.signInButton = button
    }
    
    func addSignUpButton() {
        let button = UIButton(type: UIButton.ButtonType.custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(button)
        
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(UIColor.red, for: .normal)
        
        button.addTarget(self, action: #selector(touchUpSignUpButton), for: UIControl.Event.touchUpInside)
        
        let top: NSLayoutConstraint = button.topAnchor.constraint(equalTo: self.pwdTextField.bottomAnchor, constant: 5)
        let right: NSLayoutConstraint = button.rightAnchor.constraint(equalTo: self.titleImageView.rightAnchor, constant: -20)
        
        top.isActive = true
        right.isActive = true
        
        self.signUpButton = button
    }
    
}

