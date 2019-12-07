//
//  TweetCell.swift
//  TwitterLBTA
//
//  Created by BeInMedia on 12/7/19.
//  Copyright © 2019 MIF50. All rights reserved.
//

import LBTAComponents

class TweetCell: DatasourceCell {
    
    /* image view for user  */
       let profileImageView : UIImageView = {
          let imageView = UIImageView()
           imageView.image = #imageLiteral(resourceName: "image_profile")
           imageView.layer.cornerRadius = 5
           imageView.clipsToBounds = true
           return imageView
       }()
    
    override func setupViews() {
        super.setupViews()
        
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        backgroundColor = .white
        
        addSubview(profileImageView)
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
        
    }
}
