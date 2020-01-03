//
//  UserCell.swift
//  TwitterLBTA
//
//  Created by BeInMedia on 11/23/19.
//  Copyright © 2019 MIF50. All rights reserved.
//

import LBTAComponents



//TODO:- Cell for user
class UserCell: DatasourceCell {
    
    override var datasourceItem: Any? {
        didSet {
            guard let user = datasourceItem as? User else {return}
            nameLabel.text = user.name
            usernameLabel.text = user.username
            bioTextView.text = user.bioText
            profileImageView.loadImage(urlString: user.profileImageUrl)
        
        }
        
    }
    /* text label of user */
    let nameLabel : UILabel = {
        let label = UILabel()
        label.text = "Mohamed Ibrahim"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    /* image view for user  */
    let profileImageView : CachedImageView = {
       let imageView = CachedImageView()
        imageView.image = #imageLiteral(resourceName: "image_profile")
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        return imageView
    }()
    
    /*username label for usre */
    let usernameLabel : UILabel = {
        let label = UILabel()
        label.text = "@mobiledeveloper"
        label.textColor = UIColor(r: 130, g: 130, b: 130)
        label.font = UIFont.systemFont(ofSize: 14)
        return label
       }()
    
    /*bio text view */
    let bioTextView: UITextView = {
        let textView = UITextView()
        textView.text = "works as android developer usign kotlin and java and learning ios using swift and swiftUI and develop my self every single day!"
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.backgroundColor = .clear
        return textView
    }()
    
    /* follow button */
    let followButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 5
        button.layer.borderColor = twitterBlue.cgColor
        button.layer.borderWidth = 1
        button.setTitle("Follow", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(twitterBlue, for: .normal)
        button.setImage(#imageLiteral(resourceName: "follow_icon"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(
            top: 0,
            left: -12,
            bottom: 0,
            right: 0
        )
//        button.titleEdgeInsets = UIEdgeInsets(
//            top: 0,
//            left: -100,
//            bottom: 0,
//            right: 0
//        )
        return button
    }()
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = .white
        
        // add separatorLineView
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 200, g: 200, b: 200)
        
        addSubview(profileImageView)
        addSubview(nameLabel)
        addSubview(usernameLabel)
        addSubview(bioTextView)
        addSubview(followButton)
        
        
        profileImageView.anchor(
            self.topAnchor,
            leading: self.leadingAnchor,
            bottom: nil,
            trailing: nil,
            topConstant: 12,
            leftConstant: 12,
            widthConstant: 55,
            heightConstant: 55
        )
       
        nameLabel.anchor(
            profileImageView.topAnchor,
            leading: profileImageView.trailingAnchor,
            bottom: nil,
            trailing : followButton.leadingAnchor,
            leftConstant: 8,
            rightConstant: 12,
            heightConstant: 20
        )
        
        usernameLabel.anchor(
            nameLabel.bottomAnchor,
            leading: nameLabel.leadingAnchor,
            bottom: nil,
            trailing: nameLabel.trailingAnchor,
            topConstant: 0,
            heightConstant: 20
        )
        
        bioTextView.anchor(
            usernameLabel.bottomAnchor,
            leading: usernameLabel.leadingAnchor,
            bottom: self.bottomAnchor,
            trailing: self.trailingAnchor,
            topConstant: -4,
            leftConstant: -4
        )
        
        followButton.anchor(
            self.topAnchor,
            leading: nil,
            bottom: nil,
            trailing: self.trailingAnchor,
            topConstant: 12,
            rightConstant: 8,
            widthConstant: 120,
            heightConstant: 34
        )
    }

}
