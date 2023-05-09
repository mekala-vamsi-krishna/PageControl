//
//  LinePageControl.swift
//  CollectionViewSlider
//
//  Created by Mekala Vamsi Krishna on 07/05/23.
//

import UIKit

class LinePageControl: UIView {
    
    var numberOfPages: Int = 0 {
        didSet {
            updatePages()
        }
    }
    
    var currentPage: Int = 0 {
        didSet {
            updateCurrentPage()
        }
    }
    
    var pageIndicatorColor: UIColor = .lightGray {
        didSet {
            updatePageIndicatorColor()
        }
    }
    
    private func updatePageIndicatorColor() {
        for (index, pageView) in pageViews.enumerated() {
            pageView.backgroundColor = (index == currentPage) ? .blue : pageIndicatorColor
        }
    }
    
    private var pageViews: [UIView] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        numberOfPages = 0
        currentPage = 0
        
        for _ in 0..<numberOfPages {
            let pageView = UIView()
            pageView.layer.cornerRadius = 1.5
            pageView.layer.masksToBounds = true
            addSubview(pageView)
            pageViews.append(pageView)
        }
        
        setNeedsLayout()
    }
    
    private func updatePages() {
        pageViews.forEach { $0.removeFromSuperview() }
        pageViews.removeAll()
        for _ in 0..<numberOfPages {
            let pageView = UIView()
            pageView.layer.cornerRadius = 1.5
            pageView.layer.masksToBounds = true
            addSubview(pageView)
            pageViews.append(pageView)
        }
        
        setNeedsLayout()
    }
    
    private func updateCurrentPage() {
        for (index, pageView) in pageViews.enumerated() {
            if index == currentPage {
                pageView.backgroundColor = .systemBlue
            } else {
                pageView.backgroundColor = .lightGray
            }
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let spacing: CGFloat = 4.0
        let pageWidth: CGFloat = 30.0
        let lineHeight: CGFloat = 3.0
        let totalWidth = CGFloat(numberOfPages) * pageWidth + CGFloat(numberOfPages - 1) * spacing
        let startX = (frame.width - totalWidth) / 2.0
        for (index, pageView) in pageViews.enumerated() {
            let x = startX + CGFloat(index) * (pageWidth + spacing)
            let y = (frame.height - pageWidth) / 2.0
            pageView.frame = CGRect(x: x, y: y, width: pageWidth, height: lineHeight)
        }
    }
    
}
