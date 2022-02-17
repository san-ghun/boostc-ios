//
//  SignUpSecondViewController.swift
//  SignUp-demo
//
//  Created by Sanghun Park on 2022/02/17.
//

import UIKit

class SignUpSecondViewController: UIViewController {

    // MARK: - Properties
    // TODO: let dateFormatter: DateFormatter = {}
    
    // MARK: IBOutlets
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    
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
    // TODO: @IBAction func didDatePickerValueChanged
    // TODO: @IBAction func didTappedCancelButton
    // TODO: @IBAction func didTappedNextButton
    // TODO: @IBAction func tapView
    
    // MARK: View with code
    func addViewWithCode() {
        self.addPhoneNumberLabel()
        self.addPhoneNumberTextField()
        self.addDateLabel()
        self.addDatePicker()
    }
    
    func addPhoneNumberLabel() {
        
    }
    func addPhoneNumberTextField() {
        
    }
    func addDateLabel() {
        
    }
    func addDatePicker() {
        
    }
    
    
}
