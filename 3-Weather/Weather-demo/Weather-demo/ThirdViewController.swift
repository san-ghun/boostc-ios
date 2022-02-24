//
//  ThirdViewController.swift
//  Weather-demo
//
//  Created by Sanghun Park on 2022/02/24.
//

import UIKit

class ThirdViewController: UIViewController {

    // MARK: - Properties
    var city: City?
    
    // MARK: IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var rainProbLabel: UILabel!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationItem.title = self.city?.cityName
        
        self.imageView.image = UIImage(named: self.city!.stateImage)
        self.stateLabel.text = self.city?.stateString
        self.temperatureLabel.text = "\(self.city!.celsius) C / \(self.city!.fahrenheit) F"
        self.rainProbLabel.text = "\(self.city!.rainfallProbability)%"
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

    

}
