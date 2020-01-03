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
    
    func fetchHomeFeed(completion: @escaping ([User]?,[Tweet]?,APIError?)->()) {
        
        // start json fetch
        let request: APIRequest<Home, APIError> = tron.codable.request("/twitter/home")
        request.perform(withSuccess: { (home) in
            print("success fetch home data \(home)")
            var usersData = [User]()
            home.users.forEach { (data) in
                usersData.append(User(withUser: data))
            }
            var tweetData = [Tweet]()
            home.tweets.forEach { (tweet) in
                let tweetUser = User(withUser: tweet.user)
                tweetData.append(Tweet(user: tweetUser, message: tweet.message))
            }
            
            completion(usersData,tweetData,nil)
            
            
        }) { (error) in
            completion(nil,nil,error)
            print("error when fetching home data \(String(describing: error))")
        }
    }
    
    
    struct Home: Codable {
        let users: [UserData]
        let tweets: [TweetData]
        
        
    }
    struct UserData: Codable {
        let id: Int
        let name: String
        let username: String
        let bio: String
        let profileImageUrl: String
        
    }
    
    struct TweetData: Codable {
        let user: UserData
        let message: String

    }
    
}
