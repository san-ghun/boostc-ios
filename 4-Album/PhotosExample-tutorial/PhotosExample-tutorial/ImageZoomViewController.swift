//
//  ImageZoomViewController.swift
//  PhotosExample-tutorial
//
//  Created by Sanghun Park on 2022/03/01.
//

import UIKit
import Photos

class ImageZoomViewController: UIViewController, UIScrollViewDelegate {

    // MARK: - Properties
    var asset: PHAsset!
    let imageManager: PHCachingImageManager = PHCachingImageManager()
    
    // MARK: IBOutlets
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.scrollView.delegate = self
        
        imageManager.requestImage(for: asset, targetSize: CGSize(width: asset.pixelWidth, height: asset.pixelHeight), contentMode: .aspectFill, options: nil, resultHandler: { image, _ in
            self.imageView.image = image
        })
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
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
    
    // MARK: IBActions
    @IBAction func touchUpRefreshButton(_ sender: Any) {
        self.scrollView.setZoomScale(1.0, animated: true)
    }
    
}
