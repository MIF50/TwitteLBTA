//
//  HomeDatasourceController.swift
//  TwitterLBTA
//
//  Created by BeInMedia on 10/14/19.
//  Copyright © 2019 MIF50. All rights reserved.
//

import LBTAComponents
import TRON


class HomeDatasourceController: DatasourceController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = UIColor(r: 232, g: 236, b: 241)
        
        setupNavigationBarItem()
        
//        self.datasource = homeDatasourse
        
        Service.sharedInstance.fetchHomeFeed { (usersData) in
            let homeDatasourse = HomeDatasource()
            homeDatasourse.users = usersData
            self.datasource = homeDatasourse
            
        }
//        fetchHomeFeed()
    }
    
    /* invalid layout when change orientation */
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionViewLayout.invalidateLayout()
    }
    
   
    
    /*use this methed to set spacing between cell in collection view */
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    /*this is to add the size of header in collection view */
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 1 {
            return .zero
        }
        return CGSize(width: view.frame.width, height: 50)
    }
    
    /* this is to add size for cell in collection view */
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let user = self.datasource?.item(indexPath) as? User {
            // let's get an estimation of the height of our cell based on User.bioText
            let approximateWidthOfBioTextView = view.frame.width - 12 - 55 - 12 - 2
            let size = CGSize(width: approximateWidthOfBioTextView, height: 1000)
            let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)]
            let estimatedFramge = NSString(string: user.bioText)
                .boundingRect(
                    with: size,
                    options: .usesLineFragmentOrigin,
                    attributes: attributes,
                    context: nil
            )
            
            return CGSize(width: view.frame.width, height: estimatedFramge.height + 66)
            

        }
        return CGSize(width: view.frame.width, height: 200)
    }
    /*this is to add the size of footer in collection view */
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == 1 {
            return .zero
        }
        return CGSize(width: view.frame.width, height: 64)
    }
}
