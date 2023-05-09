//
//  ViewController.swift
//  CollectionViewSlider
//
//  Created by Mekala Vamsi Krishna on 06/05/23.
//

import UIKit

struct Item {
    let profileImage: UIImage?
    let name: String
    let number: String
    let rd: String
    let scannerImage: UIImage?
    let scannerCode: String
    let company: String
}

class ViewController: UIViewController {
    
     //MARK: Properties
    var currentPageIndex = 0
    
    let items: [Item] = [
        Item(profileImage: UIImage(named: "cn"), name: "Christopher Nolan", number: "89899", rd: "R&D", scannerImage: UIImage(named: "qr"), scannerCode: "9989 7878 6813 8921", company: "ARMATURA"),
        Item(profileImage: UIImage(named: "et"), name: "Emma Thomas", number: "89345", rd: "R&D", scannerImage: UIImage(named: "qr"), scannerCode: "9989 7878 6813 8921", company: "ARMATURA"),
        Item(profileImage: UIImage(named: "md"), name: "Matt Damon", number: "23756", rd: "R&D", scannerImage: UIImage(named: "qr"), scannerCode: "9989 7878 6813 8921", company: "ARMATURA"),
        Item(profileImage: UIImage(named: "cb"), name: "Christian Bale", number: "98412", rd: "R&D", scannerImage: UIImage(named: "qr"), scannerCode: "9989 7878 6813 8921", company: "ARMATURA"),
        Item(profileImage: UIImage(named: "ah"), name: "Anne Hathway", number: "74802", rd: "R&D", scannerImage: UIImage(named: "qr"), scannerCode: "9989 7878 6813 8921", company: "ARMATURA"),
    ]
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.layer.cornerRadius = 10
     //   collectionView.register(ItemCollectionViewCell.self, forCellWithReuseIdentifier: ItemCollectionViewCell.identifier)
        collectionView.register(UINib(nibName: "CardsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CardsCollectionViewCell")

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    let tapImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "tap")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let pageControl: LinePageControl = {
        let pageControl = LinePageControl()
        pageControl.numberOfPages = 5
        pageControl.currentPage = 0
        pageControl.pageIndicatorColor = .lightGray
        
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()

     //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
        view.addSubview(tapImageView)
        view.addSubview(pageControl)
        
        currentPageIndex = pageControl.currentPage
        
        addConstraints()
        configureNavbar()
    }
    
     //MARK: addConstraints
    func addConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            collectionView.bottomAnchor.constraint(equalTo: tapImageView.topAnchor, constant: -10),
            
            tapImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tapImageView.heightAnchor.constraint(equalToConstant: 60),
            tapImageView.widthAnchor.constraint(equalToConstant: 60),
            tapImageView.bottomAnchor.constraint(equalTo: pageControl.topAnchor, constant: -30),
            
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.heightAnchor.constraint(equalToConstant: 3),
            pageControl.widthAnchor.constraint(equalToConstant: 200),
            pageControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)

        ])
    }
    
     //MARK: configureNavbar
    func configureNavbar() {
        navigationItem.leftBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal.decrease"), style: .done, target: self, action: #selector(menuTapped)),
            UIBarButtonItem(title: "Credentials", style: .done, target: self, action: #selector(logoTapped))
        ]
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus.square"), style: .plain, target: self, action: #selector(plusTapped))
        navigationController?.navigationBar.tintColor = UIColor.black
    }
    
     //MARK: @objc methods
    @objc func menuTapped() {
        print("Menu Tapped")
    }
    
    @objc func logoTapped() {
        print("logo Tapped")
    }
    
    @objc func plusTapped() {
        print("Plus Tapped")
    }

}

 //MARK: UICollectionViewDataSource, UICollectionViewDelegate
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCollectionViewCell.identifier, for: indexPath) as! ItemCollectionViewCell
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardsCollectionViewCell", for: indexPath) as! CardsCollectionViewCell

        cell.tag = indexPath.row
        cell.backgroundImageView.image = UIImage(named: "bg")
        cell.profileImageView.image = items[indexPath.row].profileImage
        cell.nameLabel.text = items[indexPath.row].name
        cell.numberLabel.text = items[indexPath.row].number
        cell.designationLabel.text = items[indexPath.row].rd
        cell.scannerImageView.image = items[indexPath.row].scannerImage
        cell.scannerCodeLabel.text = items[indexPath.row].scannerCode
        cell.companyLabel.text = items[indexPath.row].company
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.pageControl.currentPage = indexPath.row
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }

}

 //MARK: UIScrollViewDelegate
extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let centerX = collectionView.contentOffset.x + collectionView.frame.size.width / 2
        let cellWidth = collectionView.visibleCells.first?.frame.size.width ?? 0
        for cell in collectionView.visibleCells {
            let cellCenterX = cell.frame.origin.x + cellWidth / 2
            let distanceFromCenter = abs(centerX - cellCenterX)
            let minScale: CGFloat = 0.7
            let maxScale: CGFloat = 1.2
            let scaleFactor = max(minScale, min(maxScale, 1 - distanceFromCenter / collectionView.frame.size.width))
            
            UIView.animate(withDuration: 0.2) {
                cell.transform = CGAffineTransform(scaleX: scaleFactor, y: scaleFactor)
            }
        }
    }

}


