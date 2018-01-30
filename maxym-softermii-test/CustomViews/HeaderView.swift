//
//  HeaderView.swift
//  maxym-softermii-test
//
//  Created by Maxym on 1/28/18.
//  Copyright © 2018 Maxym. All rights reserved.
//

import UIKit
import RxSwift
import SDWebImage

class HeaderView: UICollectionReusableView {
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet var subtitleLabels: [UILabel]!
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var postsLabel: UILabel!
    @IBOutlet weak var followersLabel: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    @IBOutlet var numbersLabels: [UILabel]!
    
    var disposeBag = DisposeBag()
    
    
    override func prepareForReuse() {
        disposeBag = DisposeBag()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        for subtitle in subtitleLabels {
            subtitle.setFont(with: 12, and: .gray)
        }
        for label in numbersLabels {
            label.setFont(with: 25, and: .black)
        }
        nameLabel.setFont(with: 20, and: .black)
        
        userImageView.layer.cornerRadius = userImageView.frame.height/2
    }
    
    static var identifier: String {
        return String(describing: self.self)
    }
    
    func setup(with user: User) {
        postsLabel.text = "\(user.mediaCount)"
        followersLabel.text = "\(user.followedByCount)"
        followingLabel.text = "\(user.followsCount)"
        nameLabel.text = user.username
        userImageView.sd_setImage(with: URL(string: user.profilePicture))
    }
}
