//
//  ViewController.swift
//  AsyncExample-tutorial
//
//  Created by Sanghun Park on 2022/02/25.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var downloadButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }


    // MARK: - Methods
    
    // MARK: IBActions
    @IBAction func touchUpDownloadButton(_ sender: UIButton) {
        // 이미지 다운로드 -> 이미지 뷰에 셋팅
        
        guard let imageURL: URL = URL(string: "https://www.itl.cat/pngfile/big/292-2920819_large-madeira-portugal-hd.jpg") else { return }
        
        let imageData: Data = try! Data.init(contentsOf: imageURL)
        guard let image: UIImage = UIImage(data: imageData) else { return }
        
        self.imageView.image = image
    }
}

