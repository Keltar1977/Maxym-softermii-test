//
//  UILabel+Extensions.swift
//  maxym-softermii-test
//
//  Created by Maxym on 1/29/18.
//  Copyright © 2018 Maxym. All rights reserved.
//

import UIKit

extension UILabel {
    func setFont(with size: CGFloat, and color: UIColor) {
        self.font = UIFont.systemFont(ofSize: size)
        self.textColor = color
    }
}
