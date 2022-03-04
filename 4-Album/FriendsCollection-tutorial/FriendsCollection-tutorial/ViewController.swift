//
//  ViewController.swift
//  FriendsCollection-tutorial
//
//  Created by Sanghun Park on 2022/03/04.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    var friends: [Friend] = []
    let cellIdentifier: String = "cell"
    
    // MARK: IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset = NSDataAsset(name: "friends") else { return }
        
        do {
            self.friends = try jsonDecoder.decode([Friend].self, from: dataAsset.data)
        }
        catch {
            print(error.localizedDescription)
        }
        
        self.collectionView.reloadData()
    }


    // MARK: - Methods
    
    // MARK: Custom Methods
    
    // MARK: IBActions
    
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.friends.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell: FriendCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellIdentifier, for: indexPath) as? FriendCollectionViewCell else {

            fatalError("Unable to dequeue Friend Collection View Cell")
            
        }
        
        let friend: Friend = self.friends[indexPath.item]
        cell.nameAgeLable.text = friend.nameAndAge
        cell.addressLabel.text = friend.fullAddress
        
        return cell
    }
    
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//
//        self.numberOfCell += 1
//        collectionView.reloadData()
//    }
}
