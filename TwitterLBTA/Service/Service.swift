//
//  Service.swift
//  TwitterLBTA
//
//  Created by BeInMedia on 12/15/19.
//  Copyright © 2019 MIF50. All rights reserved.
//

import Foundation
import TRON

struct Service {
    let tron = TRON(baseURL: "https://api.letsbuildthatapp.com")
    
    static var sharedInstance = Service()
    
    func fetchHomeFeed(completion: @escaping ([User])->()) {
        
        // start json fetch
        let request: APIRequest<Home, APIError> = tron.codable.request("/twitter/home")
        request.perform(withSuccess: { (home) in
            print("success fetch home data \(home)")
            var usersData = [User]()
            home.users.forEach { (data) in
                usersData.append(
                    User(
                        name: data.name,
                        username: data.username,
                        bioText: data.bio,
                        profileImage: UIImage()
                    )
                )
            }
            
            completion(usersData)
            
            //                    let homeDatasourse = HomeDatasource()
            //                    homeDatasourse.users = usersData
            //                    self.datasource = homeDatasourse
            
        }) { (error) in
            print("error when fetching home data \(String(describing: error.errorDescription))")
        }
    }
    
    
    struct Home: Codable {
        let users: [UserData]
        
        
    }
    struct UserData: Codable {
        let id: Int
        let name: String
        let username: String
        let bio: String
        let profileImageUrl: String
    }
    
}
