//
//  DishCollectionViewCell.swift
//  foodApp
//
//  Created by Mateusz Matejczyk on 07.05.2018.
//  Copyright © 2018 Matejczyk. All rights reserved.
//

import UIKit

class RestaurantCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func awakeFromNib() {
        self.layer.cornerRadius = 5.0
    }
}
