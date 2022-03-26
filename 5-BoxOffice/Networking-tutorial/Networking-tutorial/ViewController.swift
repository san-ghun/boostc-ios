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
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.didReceiveFriendsNotification(_:)), name: DidReceiveFriendsNotification, object: nil)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        requestFriends()
    }

    // MARK: Methods
    
    @objc func didReceiveFriendsNotification(_ noti: Notification) {
        
        guard let friends: [Friend] = noti.userInfo?["friends"] as? [Friend] else { return }
        
        self.friends = friends
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
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
        
        guard let imageURL: URL = URL(string: friend.picture.thumbnail) else {
            return cell
        }
        guard let imageData: Data = try? Data(contentsOf: imageURL) else {
            return cell
        }
        content.image = UIImage(data: imageData)
        
        // TODO: resolve image loading process to async way
//        DispatchQueue.global().async {
//            guard let imageURL: URL = URL(string: friend.picture.thumbnail) else {
//                return
//            }
//            guard let imageData: Data = try? Data(contentsOf: imageURL) else {
//                return
//            }
//
//            DispatchQueue.main.async {
//
//                if let index: IndexPath = tableView.indexPath(for: cell) {
//                    if index.row == indexPath.row {
//                        content.text = friend.name.full
//                        content.secondaryText = friend.email
//                        content.image = UIImage(data: imageData)
//                    }
//                }
//            }
//        }
        
        cell.contentConfiguration = content
        
        return cell
    }
    
    
}
