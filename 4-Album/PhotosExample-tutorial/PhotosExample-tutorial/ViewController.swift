//
//  ViewController.swift
//  PhotosExample-tutorial
//
//  Created by Sanghun Park on 2022/02/25.
//

import UIKit
import Photos

class ViewController: UIViewController, UITableViewDataSource {
    
    // MARK: - Properties
    
    var fetchResult: PHFetchResult<PHAsset>!
    let imageManager: PHCachingImageManager = PHCachingImageManager()
    let cellIdentifier: String = "cell"
    
    // MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.tableView.dataSource = self
        
        let photoAuthorizationStatus = PHPhotoLibrary.authorizationStatus(for: .readWrite)
        
        switch photoAuthorizationStatus {
        case .notDetermined:
            print("Note determined")
            PHPhotoLibrary.requestAuthorization(for: .readWrite) { (status) in
                switch status {
                case .authorized:
                    print("Allowed by user")
                    self.requestCollection()
                    OperationQueue.main.addOperation {
                        self.tableView.reloadData()
                    }
                case .denied:
                    print("Denied by user")
                default:
                    break
                }
            }
        case .restricted:
            print("Access restricted")
        case .denied:
            print("Access denied")
        case .authorized:
            print("Access allowed")
            self.requestCollection()
            OperationQueue.main.addOperation {
                self.tableView.reloadData()
            }
        case .limited:
            print("Access limited")
        @unknown default:
            fatalError()
        }
        
    }

    // MARK: - Methods
    
    // MARK: Custom Methods
    func requestCollection() {
        
        let cameraRoll: PHFetchResult<PHAssetCollection> = PHAssetCollection.fetchAssetCollections(with: .smartAlbum, subtype: .smartAlbumUserLibrary, options: nil)
        
        guard let cameraRollCollection = cameraRoll.firstObject else { return }
        
        let fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        
        self.fetchResult = PHAsset.fetchKeyAssets(in: cameraRollCollection, options: fetchOptions)
    }
    
    // MARK: IBActions

    // MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.fetchResult?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        
        let asset: PHAsset = fetchResult.object(at: indexPath.row)
        
        imageManager.requestImage(for: asset, targetSize: CGSize(width: 30, height: 30), contentMode: .aspectFill, options: nil) { image, _ in
            content.image = image
        }
        
        cell.contentConfiguration = content
        
        return cell
    }
}

