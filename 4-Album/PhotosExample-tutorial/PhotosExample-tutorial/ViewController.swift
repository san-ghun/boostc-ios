//
//  ViewController.swift
//  PhotosExample-tutorial
//
//  Created by Sanghun Park on 2022/02/25.
//

import UIKit
import Photos

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, PHPhotoLibraryChangeObserver {
    
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
        self.tableView.delegate = self
        
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
        
        PHPhotoLibrary.shared().register(self)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        guard let nextVC: ImageZoomViewController = segue.destination as? ImageZoomViewController else { return }
        
        guard let cell: UITableViewCell = sender as? UITableViewCell else { return }
        
        guard let index: IndexPath = self.tableView.indexPath(for: cell) else { return }
        
        nextVC.asset = self.fetchResult[index.row]
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
    
    // MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            let asset: PHAsset = self.fetchResult[indexPath.row]
            
            PHPhotoLibrary.shared().performChanges ({
                PHAssetChangeRequest.deleteAssets([asset] as NSArray)
            }, completionHandler: nil)
        }
        
    }
    
    // MARK: PHPhotoLibraryChangeObserver
    func photoLibraryDidChange(_ changeInstance: PHChange) {
        
        guard let changes = changeInstance.changeDetails(for: fetchResult) else { return }
        
        fetchResult = changes.fetchResultAfterChanges
        
        OperationQueue.main.addOperation {
            self.tableView.reloadSections(IndexSet(0...0), with: .automatic)
        }
        
    }
    
}

