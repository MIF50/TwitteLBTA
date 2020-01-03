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
    
    let errorMessageLabel: UILabel = {
        let label = UILabel()
        label.text = "Applogies something went wrong. please try again later .. "
        label.textAlignment = .center
        label.numberOfLines = 0
        label.isHidden = true
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(errorMessageLabel)
        errorMessageLabel.fillSuperview()
        
        collectionView.backgroundColor = UIColor(r: 232, g: 236, b: 241)
        
        setupNavigationBarItem()
        
    
        Service.sharedInstance.fetchHomeFeed { (usersData, tweetData,error) in
            if let erro = error {
                print("error request = \(String(describing: erro.request))")
                print("error response = \(String(describing: erro.response))")
                print("error data = \(String(describing: erro.data))")

                print("error fileUri = \(String(describing: erro.fileURL))")

                print("error error = \(String(describing: erro.error))")

                if let status =  erro.response?.statusCode , status != 200 {
                    self.errorMessageLabel.text  = "status code not 200"
                }
                print("fetch Error home data source Json .. \(erro)")
                self.errorMessageLabel.isHidden = false
                return
            }
            let homeDatasourse = HomeDatasource()
            homeDatasourse.users = usersData!
            homeDatasourse.tweets = tweetData!
            self.datasource = homeDatasourse
            
        }
        
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
        // first section user cell
        if indexPath.section == 0 {
            guard let user = self.datasource?.item(indexPath) as? User else {return .zero}
            let estimatedHeight = estimatedHeightForText(user.bioText)
            return CGSize(width: view.frame.width, height: estimatedHeight + 66)
            
        }
        else if indexPath.section == 1 {
            // second section tweet cell
            guard let tweet = self.datasource?.item(indexPath) as? Tweet else {return .zero }
            let estimatedHeight = estimatedHeightForText(tweet.message)
            return CGSize(width: view.frame.width, height: estimatedHeight + 74)
            }
        return CGSize(width: view.frame.width, height: 200)
            
    }
    
    private func estimatedHeightForText(_ text: String)-> CGFloat {
        // let's get an estimation of the height of our cell based on User.bioText
        let approximateWidthOfBioTextView = view.frame.width - 12 - 55 - 12 - 2
        let size = CGSize(width: approximateWidthOfBioTextView, height: 1000)
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)]
        let estimatedFrame = NSString(string: text)
            .boundingRect(
                with: size,
                options: .usesLineFragmentOrigin,
                attributes: attributes,
                context: nil
        )
        return estimatedFrame.height
    }
    /*this is to add the size of footer in collection view */
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == 1 {
            return .zero
        }
        return CGSize(width: view.frame.width, height: 64)
    }
}
