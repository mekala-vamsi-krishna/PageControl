//
//  CardsCollectionViewCell.swift
//  CollectionViewSlider
//
//  Created by Mekala Vamsi Krishna on 07/05/23
//

import UIKit

class CardsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var designationLabel: UILabel!
    @IBOutlet weak var scannerCodeLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var scannerImageView: UIImageView!
    @IBOutlet weak var profileImageView: UIImageView!

    @IBOutlet weak var refreshView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundImageView.layer.cornerRadius = 10.0
        refreshView.layer.cornerRadius = 10.0
        profileImageView.layer.borderWidth = 1.0
        profileImageView.layer.borderColor = UIColor.white.cgColor
        profileImageView.layer.cornerRadius = 7.0
    }

}
