//
//  TweetCell.swift
//  TwitterLBTA
//
//  Created by BeInMedia on 12/7/19.
//  Copyright © 2019 MIF50. All rights reserved.
//

import LBTAComponents

class TweetCell: DatasourceCell {
    
    override var datasourceItem: Any? {
        didSet {
            guard let tweet = datasourceItem as? Tweet else { return }
            // to cutome text font
            let attributedText = NSMutableAttributedString(
                string: tweet.user.name,
                attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)]
            )
            // to cutome text font and color
            let usernameString = " \(tweet.user.username)"
            attributedText.append(
                NSAttributedString(
                    string: usernameString,
                    attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16),                     NSAttributedString.Key.foregroundColor: UIColor.gray]
                )
            )
            // to add line spacing to all between text above and text below
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 4
            let range = NSMakeRange(0, attributedText.string.count)
            attributedText.addAttributes(
                [NSAttributedString.Key.paragraphStyle: paragraphStyle],
                range: range
            )
            
            // to cutom text font
            let messageText = "\n\(tweet.message)"
            attributedText.append(
                NSAttributedString(string: messageText,
                                   attributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize:15)]
                )
            )
            
            messageTextView.attributedText = attributedText
            
        }
    }
    
    /* image view for user  */
       let profileImageView : UIImageView = {
          let imageView = UIImageView()
           imageView.image = #imageLiteral(resourceName: "image_profile")
           imageView.layer.cornerRadius = 5
           imageView.clipsToBounds = true
           return imageView
       }()
    
    /* message text view */
    let messageTextView: UITextView = {
       let tv = UITextView()
        tv.text = "Some sample text"
        return tv
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
        
        addSubview(messageTextView)
        messageTextView.anchor(
            self.topAnchor,
            leading: profileImageView.trailingAnchor,
            bottom: self.bottomAnchor,
            trailing: self.trailingAnchor,
            topConstant: 4,
            leftConstant: 4,
            bottomConstant: 0,
            rightConstant: 0,
            widthConstant: 0,
            heightConstant: 0
        )
        
    }
}
