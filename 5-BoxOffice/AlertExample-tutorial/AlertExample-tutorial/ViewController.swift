//
//  ViewController.swift
//  AlertExample-tutorial
//
//  Created by Sanghun Park on 2022/03/17.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    // MARK: IBOutlets
    

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    // MARK: - Methods
    
    // MARK: Custom Methods
    func showAlertController(style: UIAlertController.Style) {
        
        let alertController = UIAlertController(title: "Title", message: "Message", preferredStyle: style)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (action: UIAlertAction) in
            print("OK pressed")
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: {
            print("Alert Controller shown")
        })
    }
    
    // MARK: IBActions
    @IBAction func touchUpShowAlertButton(_ sender: UIButton) {
        self.showAlertController(style: UIAlertController.Style.alert)
    }
    
    @IBAction func touchUpShowActionSheetButton(_ sender: UIButton) {
        self.showAlertController(style: UIAlertController.Style.actionSheet)
    }
    
}

