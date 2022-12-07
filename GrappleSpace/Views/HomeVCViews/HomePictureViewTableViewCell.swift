//
//  HomePictureViewTableViewCell.swift
//  GrappleSpace
//
//  Created by ADMIN on 02/12/2022.
//

import UIKit

class HomePictureViewTableViewCell: UITableViewCell {

   static let identifier = "HomePictureViewTableViewCell"
    
    private let homepagePictureView: UIView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "homepagepicture")
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(homepagePictureView)
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
       applyConstraints()
    }
 
    private func applyConstraints(){
        let homepagePictureViewConstraints: [NSLayoutConstraint] = [
            homepagePictureView.topAnchor.constraint(equalTo: topAnchor),
            homepagePictureView.bottomAnchor.constraint(equalTo: bottomAnchor),
            homepagePictureView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            homepagePictureView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ]
        
        NSLayoutConstraint.activate(homepagePictureViewConstraints)
    }
    
    
    
    

}
