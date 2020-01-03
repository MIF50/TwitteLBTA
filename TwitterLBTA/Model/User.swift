//
//  User.swift
//  TwitterLBTA
//
//  Created by BeInMedia on 11/23/19.
//  Copyright © 2019 MIF50. All rights reserved.
//

import UIKit

struct User {
    let name: String
    let username: String
    let bioText: String
    let profileImageUrl: String
    
    init(withUser userData : Service.UserData) {
        name = userData.name
        username = userData.username
        bioText = userData.bio
        profileImageUrl = userData.profileImageUrl
    }
    
    init( name: String, username: String, bioText: String, profileImageUrl: String) {
        self.name = name
        self.username = username
        self.bioText = bioText
        self.profileImageUrl = profileImageUrl
    }
}
