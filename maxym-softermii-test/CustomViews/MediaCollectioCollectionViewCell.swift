//
//  MediaCollectioCollectionViewCell.swift
//  maxym-softermii-test
//
//  Created by Maxym on 1/29/18.
//  Copyright © 2018 Maxym. All rights reserved.
//

import UIKit
import SDWebImage

class MediaCollectioCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var mediaImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static var identifier: String {
        return String(describing: self.self)
    }
    
    func configure(with media: Media) {
        mediaImage.sd_setImage(with: URL(string: media.thumbImage))
    }

}
