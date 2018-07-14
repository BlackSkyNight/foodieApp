//
//  CuisineCollectionViewCell.swift
//  foodApp
//
//  Created by Mateusz Matejczyk on 26.04.2018.
//  Copyright © 2018 Matejczyk. All rights reserved.
//

import UIKit

class CuisineCollectionViewCell: UICollectionViewCell {
 
    @IBOutlet weak var bcgView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var CollectionView: UICollectionView!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    override func awakeFromNib() {
        bcgView.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1.0)
        bcgView.layer.cornerRadius = 10.0
        nameLabel.textColor = UIColor.white
        CollectionView.backgroundColor = UIColor.clear.withAlphaComponent(0.0)
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10.0
        imageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 2, height: 5)
        self.layer.shadowOpacity = 0.3
        self.layer.shadowRadius = 10.0
    }
}
