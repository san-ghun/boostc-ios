//
//  ViewController.swift
//  FriendsCollection-tutorial
//
//  Created by Sanghun Park on 2022/03/04.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    var numberOfCell: Int = 10
    let cellIdentifier: String = "cell"
    
    // MARK: IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }


    // MARK: - Methods
    
    // MARK: Custom Methods
    
    // MARK: IBActions
    
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.numberOfCell
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellIdentifier, for: indexPath)
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.numberOfCell += 1
        collectionView.reloadData()
    }
}
