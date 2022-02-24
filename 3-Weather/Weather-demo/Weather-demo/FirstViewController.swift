//
//  ViewController.swift
//  Weather-demo
//
//  Created by Sanghun Park on 2022/02/23.
//

import UIKit

class FirstViewController: UIViewController {
    
    // MARK: - Properties
    
    // MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    let cellIdentifier: String = "firstCell"
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

    // MARK: - Methods
    
    // MARK: Custom Methods
    
    // MARK: IBActions
}

extension FirstViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
