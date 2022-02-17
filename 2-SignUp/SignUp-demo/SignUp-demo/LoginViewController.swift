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
    }


    // MARK: - Methods
    
    // MARK: Custom Methods
    
    // MARK: IBActions
    @IBAction func touchUpSignUpButton() {
        let rootVC = SignUpFirstViewController()
        let navVC = UINavigationController(rootViewController: rootVC)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true, completion: nil)
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
        
    }
    
    func addIdTextField() {
        
    }
    
    func addPwdTextField() {
        
    }
    
    func addSignInButton() {
        
    }
    
    func addSignUpButton() {
        
    }
    
}

