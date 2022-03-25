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

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        guard let url: URL = URL(string: "https://randomuser.me/api/?results=20&inc=name,email,picture") else { return }
        
        let session: URLSession = URLSession(configuration: .default)
        let dataTask: URLSessionDataTask = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let data = data else { return }

            do {
                let apiResponse: APIResponse = try JSONDecoder().decode(APIResponse.self, from: data)
                self.friends = apiResponse.results
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            } catch(let err) {
                print(err.localizedDescription)
            }
        }
        
        dataTask.resume()
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
//        content.image = nil
        
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
//            content.image = UIImage(data: imageData)
//
//            DispatchQueue.main.async {
//
//                if let index: IndexPath = tableView.indexPath(for: cell) {
//                    if index.row == indexPath.row {
//                        content.image = UIImage(data: imageData)
//                    }
//                }
//            }
//        }
        
        cell.contentConfiguration = content
        
        return cell
    }
    
    
}
