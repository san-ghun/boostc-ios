//
//  SignUpFirstViewController.swift
//  SignUp-demo
//
//  Created by Sanghun Park on 2022/02/17.
//

import Foundation
import UIKit

class SignUpFirstViewController: UIViewController, UINavigationControllerDelegate {
    
    // TODO: add property to store id pwd discription
    // TODO: add method to check and validate id pwd
    // TODO: add method to check that form is valid to activate next button

    // MARK: - Properties
    lazy var imagePicker: UIImagePickerController = {
        let picker: UIImagePickerController = UIImagePickerController()
        picker.sourceType = .savedPhotosAlbum
        picker.delegate = self
        return picker
    }()
    
    var tempUserInfo = TempUserInformation()
    
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
        
        view.backgroundColor = .white
        
        self.addViewWithCode()
        navigationController?.isNavigationBarHidden = true
        
        let tapProfileImage = UITapGestureRecognizer(target: self, action: #selector(self.didTappedProfileImageView))
        profileImageView.addGestureRecognizer(tapProfileImage)
        profileImageView.isUserInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapView))
        self.view.addGestureRecognizer(tapGesture)
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
    func presentImagePicker() {
        self.present(self.imagePicker, animated: true, completion: nil)
    }
    
    // MARK: IBActions
    @IBAction func didTappedProfileImageView(_ sender: UITapGestureRecognizer) {
        self.presentImagePicker()
    }
    
    @IBAction func didTappedCancelButton() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didTappedNextButton() {
        tempUserInfo.username = self.idTextField.text ?? ""
        tempUserInfo.password = self.pwdTextField.text ?? ""
        tempUserInfo.description = self.descriptionTextView.text ?? ""
        tempUserInfo.profileImage = self.profileImageView.image?.pngData() ?? Data()
        
        let vc = SignUpSecondViewController()
        vc.tempUserInfo = self.tempUserInfo
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func tapView(_ sender: Any) {
        view.endEditing(true)
    }
    
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
        let imageView = UIImageView(image: .add)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(imageView)
        
        let left: NSLayoutConstraint = imageView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 10)
        let top: NSLayoutConstraint = imageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 60)
        let width: NSLayoutConstraint = imageView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.4)
        let ratio: NSLayoutConstraint = imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1)
        
        left.isActive = true
        top.isActive = true
        width.isActive = true
        ratio.isActive = true
        
        self.profileImageView = imageView
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
        
        let left: NSLayoutConstraint = textField.leftAnchor.constraint(equalTo: self.profileImageView.rightAnchor, constant: 10)
        let top: NSLayoutConstraint = textField.topAnchor.constraint(equalTo: self.profileImageView.topAnchor, constant: 10)
        let width: NSLayoutConstraint = textField.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.525)
        let height: NSLayoutConstraint = textField.heightAnchor.constraint(equalTo: self.profileImageView.heightAnchor, multiplier: 0.25)
        
        left.isActive = true
        top.isActive = true
        width.isActive = true
        height.isActive = true
        
        self.idTextField = textField
    }
    
    func addPwdTextField() {
        let textField = UITextField(frame: CGRect(x: 0, y: 0, width: 300, height: 30))
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(textField)
        
        textField.textContentType = .password
        textField.textAlignment = .left
        textField.isSecureTextEntry = true
        textField.placeholder = "Type Password"
        textField.autocapitalizationType = .none
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.backgroundColor = UIColor.white
        textField.textColor = UIColor.black
        
        let left: NSLayoutConstraint = textField.leftAnchor.constraint(equalTo: self.idTextField.leftAnchor)
        let top: NSLayoutConstraint = textField.topAnchor.constraint(equalTo: self.idTextField.bottomAnchor, constant: 10)
        let width: NSLayoutConstraint = textField.widthAnchor.constraint(equalTo: self.idTextField.widthAnchor)
        let height: NSLayoutConstraint = textField.heightAnchor.constraint(equalTo: self.idTextField.heightAnchor)
        
        left.isActive = true
        top.isActive = true
        width.isActive = true
        height.isActive = true
        
        self.pwdTextField = textField
    }
    
    func addSecondPwdTextField() {
        let textField = UITextField(frame: CGRect(x: 0, y: 0, width: 300, height: 30))
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(textField)
        
        textField.textContentType = .password
        textField.textAlignment = .left
        textField.isSecureTextEntry = true
        textField.placeholder = "Confirm Password"
        textField.autocapitalizationType = .none
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.backgroundColor = UIColor.white
        textField.textColor = UIColor.black
        
        let left: NSLayoutConstraint = textField.leftAnchor.constraint(equalTo: self.pwdTextField.leftAnchor)
        let top: NSLayoutConstraint = textField.topAnchor.constraint(equalTo: self.pwdTextField.bottomAnchor, constant: 10)
        let width: NSLayoutConstraint = textField.widthAnchor.constraint(equalTo: self.pwdTextField.widthAnchor)
        let height: NSLayoutConstraint = textField.heightAnchor.constraint(equalTo: self.pwdTextField.heightAnchor)
        
        left.isActive = true
        top.isActive = true
        width.isActive = true
        height.isActive = true
        
        self.secondPwdTextField = textField
    }
    
    func addDescriptionTextView() {
        let textView = UITextView(frame: CGRect(x: 0, y: 0, width: 300, height: 30))
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(textView)
        
        textView.textContentType = .none
        textView.textAlignment = .left
        textView.autocapitalizationType = .none
        textView.backgroundColor = UIColor.lightGray
        textView.textColor = UIColor.black
        
        let left: NSLayoutConstraint = textView.leftAnchor.constraint(equalTo: self.profileImageView.leftAnchor)
        let top: NSLayoutConstraint = textView.topAnchor.constraint(equalTo: self.profileImageView.bottomAnchor, constant: 10)
        let width: NSLayoutConstraint = textView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.95)
        let height: NSLayoutConstraint = textView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.6)
        
        left.isActive = true
        top.isActive = true
        width.isActive = true
        height.isActive = true
        
        self.descriptionTextView = textView
    }
    
    func addCancelButton() {
        let button = UIButton(type: UIButton.ButtonType.custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(button)
        
        button.setTitle("Cancel", for: .normal)
        button.setTitleColor(UIColor.red, for: .normal)
        
        button.addTarget(self, action: #selector(didTappedCancelButton), for: UIControl.Event.touchUpInside)
        
        let top: NSLayoutConstraint = button.topAnchor.constraint(equalTo: self.descriptionTextView.bottomAnchor)
        let left: NSLayoutConstraint = button.leftAnchor.constraint(equalTo: self.descriptionTextView.leftAnchor)
        let bottom: NSLayoutConstraint = button.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        let right: NSLayoutConstraint = button.rightAnchor.constraint(equalToSystemSpacingAfter: self.view.centerXAnchor, multiplier: 0.5)
        
        top.isActive = true
        left.isActive = true
        bottom.isActive = true
        right.isActive = true
        
        self.cancelButton = button
    }
    
    func addNextButton() {
        let button = UIButton(type: UIButton.ButtonType.custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(button)
        
        button.setTitle("Next", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        
        button.addTarget(self, action: #selector(didTappedNextButton), for: UIControl.Event.touchUpInside)
        
        let top: NSLayoutConstraint = button.topAnchor.constraint(equalTo: self.descriptionTextView.bottomAnchor)
        let left: NSLayoutConstraint = button.leftAnchor.constraint(equalToSystemSpacingAfter: self.view.centerXAnchor, multiplier: 0.5)
        let bottom: NSLayoutConstraint = button.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        let right: NSLayoutConstraint = button.rightAnchor.constraint(equalTo: self.descriptionTextView.rightAnchor)
        
        top.isActive = true
        left.isActive = true
        bottom.isActive = true
        right.isActive = true
        
        self.nextButton = button
    }

}


extension SignUpFirstViewController: UIImagePickerControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let originalImage: UIImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.profileImageView.image = originalImage
        }
        self.dismiss(animated: true, completion: nil)
    }
}
