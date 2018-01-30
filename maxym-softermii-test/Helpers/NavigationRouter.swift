//
//  NavigationRouter.swift
//  maxym-softermii-test
//
//  Created by Maxym on 1/30/18.
//  Copyright © 2018 Maxym. All rights reserved.
//

import UIKit

class NavigationRouter {
    static func showHomeScreen(from sourceVC: UIViewController) {
        let homeVC = HomeViewController.loadFromNib
        let navController = UINavigationController(rootViewController: homeVC)
        sourceVC.present(navController, animated: true, completion: nil)
    }
    
    static func showDetailsScreen(from sourceVC: UIViewController, with mediaID: String) {
        let detailsVC = DetailsViewController.loadFromNib as! DetailsViewController
        detailsVC.setMediaId(mediaID)
        sourceVC.hideBackButtonTitle()
        sourceVC.navigationController?.pushViewController(detailsVC, animated: true)
    }
}
