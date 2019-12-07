//
//  HomeDatasourceController+NavBar.swift
//  TwitterLBTA
//
//  Created by BeInMedia on 11/29/19.
//  Copyright © 2019 MIF50. All rights reserved.
//

import UIKit

extension HomeDatasourceController {
    
    
    func setupNavigationBarItem() {
        setupRemainingNavItems()
        setupLeftNavItems()
        setupRightNavItems()
    }
    
    private func setupRemainingNavItems() {
        let titleImageView = UIImageView(image: #imageLiteral(resourceName: "title_icon"))
        titleImageView.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        titleImageView.contentMode = .scaleAspectFit
        navigationItem.titleView = titleImageView
        
        
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
        // to remove the default separatorLine in nav bar
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        // create navBarSeraratorLine
        let navBarSeparatorView = UIView()
        navBarSeparatorView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        view.addSubview(navBarSeparatorView)
        navBarSeparatorView.anchor(
            view.topAnchor,
            leading: view.leadingAnchor,
            bottom: nil,
            trailing: view.trailingAnchor,

            heightConstant: 0.5
        )
        
    }
    
    
    private func setupLeftNavItems() {
        let followButton = UIButton(type: .system)
        followButton.setImage(#imageLiteral(resourceName: "follow_icon").withRenderingMode(.alwaysOriginal), for: .normal)
        followButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: followButton)
    }
    
    private func setupRightNavItems() {
        let searchButton = UIButton(type: .system)
        searchButton.setImage(#imageLiteral(resourceName: "search").withRenderingMode(.alwaysOriginal), for: .normal)
        searchButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        
        let composeButton = UIButton(type: .system)
        composeButton.setImage(#imageLiteral(resourceName: "share_ic").withRenderingMode(.alwaysOriginal), for: .normal)
        composeButton.imageView?.contentMode = .scaleAspectFit
//      composeButton.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        composeButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        navigationItem.rightBarButtonItems = [ UIBarButtonItem(customView: composeButton),
                                               UIBarButtonItem(customView: searchButton) ]
        
        
        print("image width = \(composeButton.frame.width) \n image height  = \(composeButton.frame.height)")
        
    }
    
    
    
    
}
