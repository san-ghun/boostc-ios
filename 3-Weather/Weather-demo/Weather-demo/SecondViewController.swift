//
//  SecondViewController.swift
//  Weather-demo
//
//  Created by Sanghun Park on 2022/02/24.
//

import UIKit

class SecondViewController: UIViewController {

    // MARK: - Properties
    var country: Country?
    var assetTarget: String?
    
    // MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    let cellIdentifier: String = "secondCell"
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.assetTarget = self.country?.assetName
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationItem.title = self.country?.koreanName
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

extension SecondViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = UITableViewCell()
        
        return cell
    }
    
    
}
