//
//  TweetCell.swift
//  TwitterLBTA
//
//  Created by BeInMedia on 12/7/19.
//  Copyright © 2019 MIF50. All rights reserved.
//

import LBTAComponents

class TweetCell: DatasourceCell {
    
    fileprivate let dimessionOfBottomStackView: CGFloat = 25.0
    
    override var datasourceItem: Any? {
        didSet {
            guard let tweet = datasourceItem as? Tweet else { return }
            // load image in tweet cell 
            profileImageView.loadImage(urlString: tweet.user.profileImageUrl)
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
       let profileImageView : CachedImageView = {
          let imageView = CachedImageView()
           imageView.image = #imageLiteral(resourceName: "image_profile")
           imageView.layer.cornerRadius = 5
           imageView.clipsToBounds = true
           return imageView
       }()
    
    /* message text view */
    let messageTextView: UITextView = {
       let tv = UITextView()
        tv.text = "Some sample text"
        tv.backgroundColor = .clear
        return tv
    }()
    
    /* reply buttom */
    let replyButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(#imageLiteral(resourceName: "reply").withRenderingMode(.alwaysOriginal), for: .normal)
        btn.imageEdgeInsets = UIEdgeInsets.zero
        btn.imageView?.contentMode = .scaleAspectFill
        return btn
    }()
    
    /* retweet buttom */
    let retweetButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(#imageLiteral(resourceName: "retweet").withRenderingMode(.alwaysOriginal), for: .normal)
        return btn
    }()
    
    /* like Buttom */
    let likeButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(#imageLiteral(resourceName: "like").withRenderingMode(.alwaysOriginal), for: .normal)
        return btn
    }()
    
    /* direct message Buttom */
    let directMessageButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(#imageLiteral(resourceName: "send_message").withRenderingMode(.alwaysOriginal), for: .normal)
        return btn
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
        
        setupBottomButtons()
        
    }
    
    fileprivate func setupBottomButtons() {
        let replyButtomContainerView = UIView()
//        replyButtomContainerView.backgroundColor = .red
        
        let retweetButtomContainerView = UIView()
//        retweetButtomContainerView.backgroundColor = .blue
        
        let likeButtomContainerView = UIView()
//        likeButtomContainerView.backgroundColor = .green
        
        let directMessageButtomContainerView = UIView()
//        directMessageButtomContainerView.backgroundColor = .purple
        
        let buttomStackView = UIStackView(arrangedSubviews: [
        replyButtomContainerView,
        retweetButtomContainerView,
        likeButtomContainerView,
        directMessageButtomContainerView
        ])
        buttomStackView.axis = .horizontal
        buttomStackView.distribution = .fillEqually
        
        addSubview(buttomStackView)
        buttomStackView.anchor(nil, leading: messageTextView.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 4, rightConstant: 0, widthConstant: 0, heightConstant: dimessionOfBottomStackView)
        
        addSubview(replyButton)
        replyButton.anchor(
            replyButtomContainerView.topAnchor,
            leading: replyButtomContainerView.leadingAnchor,
            bottom: replyButtomContainerView.bottomAnchor,
            trailing: nil,
            topConstant: 0,
            leftConstant: 0,
            bottomConstant: 0,
            rightConstant: 0,
            widthConstant: dimessionOfBottomStackView,
            heightConstant: 0
        )
        
        addSubview(retweetButton)
        retweetButton.anchor(
            retweetButtomContainerView.topAnchor,
            leading: retweetButtomContainerView.leadingAnchor,
            bottom: retweetButtomContainerView.bottomAnchor,
            trailing: nil,
            topConstant: 0,
            leftConstant: 0,
            bottomConstant: 0,
            rightConstant: 0,
            widthConstant: dimessionOfBottomStackView,
            heightConstant: 0
        )
        
        addSubview(likeButton)
        likeButton.anchor(
            likeButtomContainerView.topAnchor,
            leading: likeButtomContainerView.leadingAnchor,
            bottom: likeButtomContainerView.bottomAnchor,
            trailing: nil,
            topConstant: 0,
            leftConstant: 0,
            bottomConstant: 0,
            rightConstant: 0,
            widthConstant: dimessionOfBottomStackView,
            heightConstant: 0
        )
        
        addSubview(directMessageButton)
        directMessageButton.anchor(
            directMessageButtomContainerView.topAnchor,
            leading: directMessageButtomContainerView.leadingAnchor,
            bottom: directMessageButtomContainerView.bottomAnchor,
            trailing: nil,
            topConstant: 0,
            leftConstant: 0,
            bottomConstant: 0,
            rightConstant: 0,
            widthConstant: dimessionOfBottomStackView,
            heightConstant: 0
        )
    }
}
