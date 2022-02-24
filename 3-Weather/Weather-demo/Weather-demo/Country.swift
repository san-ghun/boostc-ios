//
//  Country.swift
//  Weather-demo
//
//  Created by Sanghun Park on 2022/02/24.
//

import Foundation

// {"korean_name":"한국","asset_name":"kr"},

struct Country: Codable {
    
    let koreanName: String
    let assetName: String
    
    var imageAssetname: String {
        return "flag_" + self.assetName
    }
    
    enum CodingKeys: String, CodingKey {
        case koreanName = "korean_name"
        case assetName = "asset_name"
    }
}
