//
//  ItemCollectionViewCell.swift
//  CollectionViewSlider
//
//  Created by Mekala Vamsi Krishna on 06/05/23.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    
     //MARK: Properties
    static let identifier = "ItemCollectionViewCell"
    
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    let saveImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(systemName: "bookmark.fill")
        imageView.tintColor = UIColor.white
        return imageView
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 3
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    let numberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    let RDLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    let scannerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
//        imageView.layer.borderColor = UIColor.white.cgColor
//        imageView.layer.borderWidth = 3
        imageView.backgroundColor = .white
        imageView.clipsToBounds = false
        imageView.isUserInteractionEnabled = true
        imageView.layer.cornerRadius = 10
//        imageView.layer.shadowColor = UIColor.black.cgColor
//        imageView.layer.shadowOffset = CGSize(width: 0, height: 2)
//        imageView.layer.shadowOpacity = 0.5
//        imageView.layer.shadowRadius = 5
        return imageView
    }()
    
    let refreshView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.isUserInteractionEnabled = true
        view.layer.cornerRadius = 10
        return view
    }()
    
    let contentFitView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.isUserInteractionEnabled = true
        return view
    }()
    
    let refreshButton: UIButton = {
        let button = UIButton()
        button.setTitle("↻ Refresh", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self, action: #selector(refreshTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func refreshTapped() {
        print("Refresh Tapped...")
    }
    
    let scannerCodeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    let companyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
     //MARK: init(fram: CGRect)
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(backgroundImageView)
        backgroundImageView.addSubview(saveImageView)
        backgroundImageView.addSubview(contentFitView)
        
        contentFitView.addSubview(profileImageView)
        contentFitView.addSubview(nameLabel)
        contentFitView.addSubview(numberLabel)
        contentFitView.addSubview(RDLabel)
        contentFitView.addSubview(refreshView)
        refreshView.addSubview(scannerImageView)
        refreshView.addSubview(refreshButton)
        contentFitView.addSubview(scannerCodeLabel)
        contentFitView.addSubview(companyLabel)
        
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        saveImageView.translatesAutoresizingMaskIntoConstraints = false
        contentFitView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        RDLabel.translatesAutoresizingMaskIntoConstraints = false
        scannerImageView.translatesAutoresizingMaskIntoConstraints = false
        refreshView.translatesAutoresizingMaskIntoConstraints = false
        refreshButton.translatesAutoresizingMaskIntoConstraints = false
        scannerCodeLabel.translatesAutoresizingMaskIntoConstraints = false
        companyLabel.translatesAutoresizingMaskIntoConstraints = false
        

        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            saveImageView.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: 20),
            saveImageView.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor, constant: -10),
            saveImageView.heightAnchor.constraint(equalToConstant: 25),
            saveImageView.widthAnchor.constraint(equalToConstant: 25),
            
//            contentFitView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            contentFitView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            contentFitView.centerYAnchor.constraint(equalTo: backgroundImageView.centerYAnchor),
            contentFitView.centerXAnchor.constraint(equalTo: backgroundImageView.centerXAnchor),
            contentFitView.heightAnchor.constraint(equalToConstant: 385),
            
            profileImageView.topAnchor.constraint(equalTo: contentFitView.topAnchor, constant: 25),
            profileImageView.centerXAnchor.constraint(equalTo: contentFitView.centerXAnchor),
            profileImageView.heightAnchor.constraint(equalToConstant: 100),
            profileImageView.widthAnchor.constraint(equalToConstant: 100),
            
            nameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 8),
            nameLabel.centerXAnchor.constraint(equalTo: contentFitView.centerXAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 18),
//            nameLabel.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 10),
//            nameLabel.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor, constant: -10),
            
            numberLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            numberLabel.centerXAnchor.constraint(equalTo: contentFitView.centerXAnchor),
            numberLabel.heightAnchor.constraint(equalToConstant: 18),
//            numberLabel.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 10),
//            numberLabel.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor, constant: -10),
            
            RDLabel.topAnchor.constraint(equalTo: numberLabel.bottomAnchor, constant: 8),
            RDLabel.centerXAnchor.constraint(equalTo: contentFitView.centerXAnchor),
            RDLabel.heightAnchor.constraint(equalToConstant: 18),
//            RDLabel.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 10),
//            RDLabel.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor, constant: -10),
            
            refreshView.topAnchor.constraint(equalTo: RDLabel.bottomAnchor, constant: 15),
            refreshView.centerXAnchor.constraint(equalTo: contentFitView.centerXAnchor),
            refreshView.heightAnchor.constraint(equalToConstant: 180),
            refreshView.widthAnchor.constraint(equalToConstant: 180),
            
            scannerImageView.topAnchor.constraint(equalTo: refreshView.topAnchor, constant: 10),
            scannerImageView.heightAnchor.constraint(equalToConstant: 145),
            scannerImageView.widthAnchor.constraint(equalToConstant: 150),
            scannerImageView.centerXAnchor.constraint(equalTo: refreshView.centerXAnchor),

            refreshButton.topAnchor.constraint(equalTo: scannerImageView.bottomAnchor, constant: 0),
            refreshButton.heightAnchor.constraint(equalToConstant: 20),
            refreshButton.widthAnchor.constraint(equalToConstant: 200),
            refreshButton.centerXAnchor.constraint(equalTo: refreshView.centerXAnchor),


//            scannerImageView.leadingAnchor.constraint(equalTo: scannerImageView.leadingAnchor, constant: 20),
//            scannerImageView.trailingAnchor.constraint(equalTo: scannerImageView.trailingAnchor, constant: -20),
//            scannerImageView.bottomAnchor.constraint(equalTo: scannerImageView.bottomAnchor, constant: -9),
//            scannerImageView.heightAnchor.constraint(equalToConstant: 20),
            
//            refreshButton.leadingAnchor.constraint(equalTo: refreshView.leadingAnchor),
//            refreshButton.trailingAnchor.constraint(equalTo: refreshView.trailingAnchor),
//            refreshView.centerXAnchor.constraint(equalTo: refreshView.centerXAnchor),
//            refreshView.centerYAnchor.constraint(equalTo: refreshView.centerYAnchor),
            
            scannerCodeLabel.topAnchor.constraint(equalTo: refreshView.bottomAnchor, constant: 20),
            scannerCodeLabel.centerXAnchor.constraint(equalTo: contentFitView.centerXAnchor),
            scannerCodeLabel.heightAnchor.constraint(equalToConstant: 20),
//            scannerCodeLabel.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 10),
//            scannerCodeLabel.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor, constant: -10),
            
            companyLabel.topAnchor.constraint(equalTo: scannerCodeLabel.bottomAnchor, constant: 15),
            companyLabel.centerXAnchor.constraint(equalTo: contentFitView.centerXAnchor),
            companyLabel.heightAnchor.constraint(equalToConstant: 20)

//            companyLabel.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 10),
//            companyLabel.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor, constant: -10),
        ])
    }
    
     //MARK: required init
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

