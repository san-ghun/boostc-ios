//
//  SignUpFirstViewController.swift
//  SignUp-demo
//
//  Created by Sanghun Park on 2022/02/17.
//

import UIKit

class SignUpFirstViewController: UIViewController {

    // MARK: - Properties
    // TODO: Add UIImagePicker to pick profile image
    
    // MARK: IBOutlets
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwdTextField: UITextField!
    @IBOutlet weak var secondPwdTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.addViewWithCode()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - Methods
    
    // MARK: Custom Methods
    
    // MARK: IBActions
    // TODO: @IBAction func didTappedProfileImageView
    // TODO: @IBAction func didTappedCancelButton
    // TODO: @IBAction func didTappedNextButton
    // TODO: @IBAction func tapView
    
    // MARK: View with code
    func addViewWithCode() {
        self.addProfileImageView()
        self.addIdTextField()
        self.addPwdTextField()
        self.addSecondPwdTextField()
        self.addDescriptionTextView()
        self.addCancelButton()
        self.addNextButton()
    }
    
    func addProfileImageView() {
        
    }
    func addIdTextField() {
        
    }
    func addPwdTextField() {
        
    }
    func addSecondPwdTextField() {
        
    }
    func addDescriptionTextView() {
        
    }
    func addCancelButton() {
        
    }
    func addNextButton() {
        
    }

}
