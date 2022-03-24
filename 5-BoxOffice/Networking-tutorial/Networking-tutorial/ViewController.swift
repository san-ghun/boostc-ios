//
//  ViewController.swift
//  Networking-tutorial
//
//  Created by Sanghun Park on 2022/03/24.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    let cellIdentifier: String = "friendCell"
    var friends: [Friend] = []
    
    // MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
    }


    // MARK: Methods
    
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        
        let friend: Friend = self.friends[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = friend.name.full
        content.secondaryText = friend.email
        
        //TODO: load image
        
        return cell
    }
    
    
}
