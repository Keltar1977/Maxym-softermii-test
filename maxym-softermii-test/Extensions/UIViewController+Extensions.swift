//
//  UIViewController+Extension.swift
//  maxym-softermii-test
//
//  Created by Maxym on 1/28/18.
//  Copyright © 2018 Maxym. All rights reserved.
//

import UIKit

extension UIViewController {
    static var identifier: String {
        return String(describing: self.self)
    }
    
    static var loadFromNib: UIViewController {
        return self.init(nibName: self.identifier, bundle: nil)
    }
    
    func hideBackButtonTitle() {
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
    }
}
