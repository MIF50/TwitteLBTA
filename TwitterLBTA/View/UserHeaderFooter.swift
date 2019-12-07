//
//  Cell.swift
//  TwitterLBTA
//
//  Created by BeInMedia on 10/14/19.
//  Copyright © 2019 MIF50. All rights reserved.
//

import LBTAComponents

let twitterBlue = UIColor(r: 61, g: 167, b: 244)

//TODO:- HeaderUser
class UserHeader: DatasourceCell {
    
    /*text label for header cell */
      let textLable : UILabel = {
          let label = UILabel()
          label.text = "WHO TO FOLLOW"
          label.font = UIFont.systemFont(ofSize: 16)
          return label
      }()
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = .white
        
        // add separatorLineView
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 200, g: 200, b: 200)
        
        addSubview(textLable)
        textLable.anchor(
            self.topAnchor,
            leading: self.leadingAnchor,
            bottom: self.bottomAnchor,
            trailing: self.trailingAnchor,
            leftConstant: 12
        )

    }
}


//TODO:-  Footer user
class UserFooter: DatasourceCell {
    
    /*text label for footer cell */
    let textLable : UILabel = {
        let label = UILabel()
        label.text = "Show me more"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = twitterBlue
        return label
    }()
    
    let whiteBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
  
    
    override func setupViews() {
        super.setupViews()
        addSubview(whiteBackgroundView)
        addSubview(textLable)
        
        textLable.anchor(
            self.topAnchor,
            leading: self.leadingAnchor,
            bottom: self.bottomAnchor,
            trailing: self.trailingAnchor,
            leftConstant: 12, bottomConstant: 14
        )
        
        whiteBackgroundView.anchor(
            self.topAnchor,
            leading: self.leadingAnchor,
            bottom: self.bottomAnchor,
            trailing: self.trailingAnchor,
            bottomConstant: 14
            )
    }
}
