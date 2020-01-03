//
//  HomeDatasource.swift
//  TwitterLBTA
//
//  Created by BeInMedia on 10/14/19.
//  Copyright © 2019 MIF50. All rights reserved.
//

import LBTAComponents
import TRON

let imageUrl: String = "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/c38bc648-c736-4a01-bdf9-e03f55e4ab0c"

class HomeDatasource: Datasource{
    
    
    var users: [User] =  {
        let mohamedUser = User(
            name: "Mohmaed Ibrahim ",
            username: "@mobiledeveloper",
            bioText: "works as android developer usign kotlin and java and learning ios using swift and swiftUI and develop my self every single day!",
            profileImageUrl: imageUrl
        )
        let rayUser = User(
            name: "Ray Wenderlich",
            username: "@rwenderlick",
            bioText: "Ray Wenderlich is a iphone developer and tweets on topics related to iphone, software and gaming. Check out our conference.",
            profileImageUrl: imageUrl
        )

        let kindleCourseUser = User(
            name: "kindle Course",
            username: "@kindlecourse",
            bioText: "this is recently released course on https://videos.letbuildthatapp/basic-training provide some excellent guidance who to use UITableView and UICollectionView. this course also teaches some basic on swift language , for example If Statment and for loop. this will be an excellant purchase for you .",
            profileImageUrl: imageUrl
        )

        return[mohamedUser,rayUser,kindleCourseUser]
    }()
    
    
    var tweets: [Tweet] = {
        let mohamedUser = User(
            name: "Mohmaed Ibrahim ",
            username: "@mobiledeveloper",
            bioText: "works as android developer usign kotlin and java and learning ios using swift and swiftUI and develop my self every single day!",
            profileImageUrl: imageUrl
        )
        let tweet = Tweet(user: mohamedUser, message: "Welcome to episode 9 of the Twitter Series, really hope you guys are enjoying the series so far. I really need a long text block to render out so we're going to stop here.")

        let tweet2 = Tweet(user: mohamedUser, message: "This is the second tweet message for our sample project. Very ver extiting message .... ")

       return [tweet,tweet2]
    }()
    
    
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
        if indexPath.section == 1 {
            return tweets[indexPath.row]
        }
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
