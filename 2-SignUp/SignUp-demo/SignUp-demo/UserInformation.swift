//
//  UserInformation.swift
//  SignUp-demo
//
//  Created by Sanghun Park on 2022/02/17.
//

import Foundation

class UserInformation {
    
    // MARK: - Properties
    
    // Set Singleton
    static let shared: UserInformation = UserInformation()
    
    
    var username: String?
    var password: String?
    
    var phoneNumber: String?
    var dateOfBirth: String?
    
    var profileImage: Data?
    var description: String?
    
    // MARK: - Methods
}
