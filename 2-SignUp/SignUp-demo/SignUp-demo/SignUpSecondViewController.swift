//
//  SignUpSecondViewController.swift
//  SignUp-demo
//
//  Created by Sanghun Park on 2022/02/17.
//

import UIKit

class SignUpSecondViewController: UIViewController {

    // MARK: - Properties
    let dateFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = "MM/dd, yyyy"
        return formatter
    }()
    
    var tempUserInfo = TempUserInformation()
    var userInfo = UserInformation.shared
    
    // MARK: IBOutlets
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var datePickerLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var backwardButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        
        self.addViewWithCode()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapView))
        self.view.addGestureRecognizer(tapGesture)
        
        self.datePicker.addTarget(self, action: #selector(self.didDatePickerValueChanged(_:)), for: UIControl.Event.valueChanged)
        
        self.phoneNumberTextField.addTarget(self, action: #selector(editingChanged(_:)), for: UIControl.Event.editingChanged)
        
        setRegisterButtonState()
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
    func validateFields() -> Bool {
        // check that all fields are filled in
        if phoneNumberTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            datePickerLabel.text?.trimmingCharacters(in: .whitespacesAndNewlines) == nil {
            
            return false
        }
        
        return true
    }
    
    func setRegisterButtonState() {
        
        let state: Bool = validateFields()
        
        if state {
            self.registerButton.setTitleColor(UIColor.blue, for: .normal)
        }
        else {
            self.registerButton.setTitleColor(UIColor.lightGray, for: .normal)
        }
        
        self.registerButton.isEnabled = state
    }
    
    // MARK: IBActions
    @IBAction func didDatePickerValueChanged(_ sender: UIDatePicker) {
        let date: Date = self.datePicker.date
        let dateString: String = self.dateFormatter.string(from: date)
        
        self.datePickerLabel.text = dateString
        
        setRegisterButtonState()
    }
    
    @IBAction func didTappedCancelButton() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didTappedBackwardButton() {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func didTappedRegisterButton() {
        userInfo.username = tempUserInfo.username
        userInfo.password = tempUserInfo.password
        userInfo.profileImage = tempUserInfo.profileImage
        userInfo.description = tempUserInfo.description

        userInfo.phoneNumber = self.phoneNumberTextField.text
        userInfo.dateOfBirth = self.datePickerLabel.text
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tapView(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func editingChanged(_ textField: UITextField) {
        if textField.text?.count == 1 {
            if textField.text?.first == " " {
                textField.text = ""
                return
            }
        }
        setRegisterButtonState()
    }
    
    // MARK: View with code
    func addViewWithCode() {
        self.addPhoneNumberLabel()
        self.addPhoneNumberTextField()
        self.addDateLabel()
        self.addDatePicker()
        self.addDatePickerLabel()
        self.addBackwardButton()
        self.addCancelButton()
        self.addRegisterButton()
    }
    
    func addPhoneNumberLabel() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 30))
        label.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(label)
        
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.text = "????????????"
        
        let left: NSLayoutConstraint = label.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 25)
        let top: NSLayoutConstraint = label.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 80)
        let width: NSLayoutConstraint = label.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
        let height: NSLayoutConstraint = label.heightAnchor.constraint(equalToConstant: 20)
        
        left.isActive = true
        top.isActive = true
        width.isActive = true
        height.isActive = true
        
        self.phoneNumberLabel = label
    }
    
    func addPhoneNumberTextField() {
        let textField = UITextField(frame: CGRect(x: 0, y: 0, width: 300, height: 30))
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(textField)
        
        textField.textContentType = .telephoneNumber
        textField.keyboardType = .numberPad
        textField.textAlignment = .left
        textField.placeholder = "Phone Number"
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.backgroundColor = UIColor.white
        textField.textColor = UIColor.black
        
        let left: NSLayoutConstraint = textField.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20)
        let top: NSLayoutConstraint = textField.topAnchor.constraint(equalTo: self.phoneNumberLabel.bottomAnchor, constant: 10)
        let width: NSLayoutConstraint = textField.widthAnchor.constraint(equalTo: self.phoneNumberLabel.widthAnchor)
        let height: NSLayoutConstraint = textField.heightAnchor.constraint(equalTo: self.phoneNumberLabel.heightAnchor, constant: 20)
        
        left.isActive = true
        top.isActive = true
        width.isActive = true
        height.isActive = true
        
        self.phoneNumberTextField = textField
    }
    
    func addDateLabel() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 30))
        label.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(label)
        
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.text = "????????????"
        
        let left: NSLayoutConstraint = label.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 25)
        let top: NSLayoutConstraint = label.topAnchor.constraint(equalTo: self.phoneNumberTextField.bottomAnchor, constant: 30)
        let width: NSLayoutConstraint = label.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.4)
        let height: NSLayoutConstraint = label.heightAnchor.constraint(equalToConstant: 20)
        let right: NSLayoutConstraint = label.rightAnchor.constraint(equalToSystemSpacingAfter: self.view.centerXAnchor, multiplier: 0.5)
        
        left.isActive = true
        top.isActive = true
        width.isActive = true
        height.isActive = true
        right.isActive = true
        
        self.dateLabel = label
    }
    
    func addDatePickerLabel() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 30))
        label.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(label)
        
        label.textAlignment = .right
        label.textColor = .black
        
        let left: NSLayoutConstraint = label.leftAnchor.constraint(equalToSystemSpacingAfter: self.view.centerXAnchor, multiplier: 0.5)
        let top: NSLayoutConstraint = label.topAnchor.constraint(equalTo: self.dateLabel.topAnchor)
        let width: NSLayoutConstraint = label.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.4)
        let height: NSLayoutConstraint = label.heightAnchor.constraint(equalToConstant: 20)
        let right: NSLayoutConstraint = label.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -25)
        
        left.isActive = true
        top.isActive = true
        width.isActive = true
        height.isActive = true
        right.isActive = true
        
        self.datePickerLabel = label
    }
    
    func addDatePicker() {
        let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: 300, height: 30))
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(datePicker)
        
        datePicker.datePickerMode = UIDatePicker.Mode.date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.timeZone = NSTimeZone.local
        datePicker.backgroundColor = UIColor.white
        
        let centerX: NSLayoutConstraint = datePicker.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        let top: NSLayoutConstraint = datePicker.topAnchor.constraint(equalTo: self.dateLabel.bottomAnchor, constant: 10)
        let width: NSLayoutConstraint = datePicker.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8)
        
        centerX.isActive = true
        top.isActive = true
        width.isActive = true
        
        self.datePicker = datePicker
    }
    
    func addCancelButton() {
        let button = UIButton(type: UIButton.ButtonType.custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(button)
        
        button.setTitle("??????", for: .normal)
        button.setTitleColor(UIColor.red, for: .normal)
        
        button.addTarget(self, action: #selector(didTappedCancelButton), for: UIControl.Event.touchUpInside)
        
        let top: NSLayoutConstraint = button.topAnchor.constraint(equalTo: self.backwardButton.topAnchor)
        let right: NSLayoutConstraint = button.rightAnchor.constraint(equalTo: self.backwardButton.leftAnchor, constant: -5)
        let width: NSLayoutConstraint = button.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.3)
        
        top.isActive = true
        right.isActive = true
        width.isActive = true
        
        self.cancelButton = button
    }
    
    func addBackwardButton() {
        let button = UIButton(type: UIButton.ButtonType.custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(button)
        
        button.setTitle("??????", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        
        button.addTarget(self, action: #selector(didTappedBackwardButton), for: UIControl.Event.touchUpInside)
        
        let centerX: NSLayoutConstraint = button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        let top: NSLayoutConstraint = button.topAnchor.constraint(equalTo: self.datePicker.bottomAnchor, constant: 30)
        let width: NSLayoutConstraint = button.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.3)
        
        centerX.isActive = true
        top.isActive = true
        width.isActive = true
        
        self.backwardButton = button
    }
    
    func addRegisterButton() {
        let button = UIButton(type: UIButton.ButtonType.custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(button)
        
        button.setTitle("??????", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        
        button.addTarget(self, action: #selector(didTappedRegisterButton), for: UIControl.Event.touchUpInside)
        
        let top: NSLayoutConstraint = button.topAnchor.constraint(equalTo: self.backwardButton.topAnchor)
        let left: NSLayoutConstraint = button.leftAnchor.constraint(equalTo: self.backwardButton.rightAnchor, constant: 5)
        let width: NSLayoutConstraint = button.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.3)
        
        top.isActive = true
        left.isActive = true
        width.isActive = true
        
        self.registerButton = button
    }
}
