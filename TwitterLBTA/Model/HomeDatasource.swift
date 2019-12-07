//
//  HomeDatasource.swift
//  TwitterLBTA
//
//  Created by BeInMedia on 10/14/19.
//  Copyright © 2019 MIF50. All rights reserved.
//

import LBTAComponents


class HomeDatasource: Datasource {
    
    let users: [User] =  {
        let mohamedUser = User(
            name: "Mohmaed Ibrahim ",
            username: "@mobiledeveloper",
            bioText: "works as android developer usign kotlin and java and learning ios using swift and swiftUI and develop my self every single day!",
            profileImage: #imageLiteral(resourceName: "image_profile")
        )
        let rayUser = User(
            name: "Ray Wenderlich",
            username: "@rwenderlick",
            bioText: "Ray Wenderlich is a iphone developer and tweets on topics related to iphone, software and gaming. Check out our conference.",
            profileImage: #imageLiteral(resourceName: "ray_profile_image")
        )
        
        let kindleCourseUser = User(
            name: "kindle Course",
            username: "@kindlecourse",
            bioText: "this is recently released course on https://videos.letbuildthatapp/basic-training provide some excellent guidance who to use UITableView and UICollectionView. this course also teaches some basic on swift language , for example If Statment and for loop. this will be an excellant purchase for you .",
            profileImage: #imageLiteral(resourceName: "image_profile")
        )
        
        return[mohamedUser,rayUser,kindleCourseUser]
    }()
    
    
    let tweets = ["tweet1", "tweet2"]
    
    
    /* Header */
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    /* cells */
    override func cellClasses() -> [DatasourceCell.Type] {
        return[UserCell.self, TweetCell.self]
    }
    
    /* footer */
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }

    /* item for every cell */
    override func item(_ indexPath: IndexPath) -> Any? {
        return users[indexPath.item]
    }
    /* to set number of section in collection view */
    override func numberOfSections() -> Int {
        return 2
    }
    
    /* number of items in collection view */
    override func numberOfItems(_ section: Int) -> Int {
        if section == 1 {
            return tweets.count
        }
        return users.count
    }
}
