//
//  Icon.swift
//  TableViewCell_DisplayDifferentSeasons
//
//  Created by Pranay Boggarapu on 7/26/18.
//  Copyright © 2018 Pranay Boggarapu. All rights reserved.
//

import UIKit

enum RatingType: Int {
    case Unrated
    case Ugly
    case OK
    case Nice
    case Awesome
}

class Icon {
    
    var title: String
    var subTitle: String
    var image: UIImage?
    var rating = RatingType.Unrated
    
    init(withTitle title: String, subtitle: String, imageName: String?) {
        self.title = title
        self.subTitle = subtitle
        if let imageName = imageName {
            if let iconImage = UIImage(named: imageName) {
                image = iconImage
            }
        }
    }
}
