//
//  HomeCourseCollectionViewCell.swift
//  GrappleSpace
//
//  Created by ADMIN on 29/11/2022.
//

import UIKit

class HomeCourseCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "HomeCourseCollectionViewCell"

    
    private let collectionViewImage: UIImageView = {
       
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .white
        return imageView
    }()
    
    let previewButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.layer.borderColor = UIColor.purple.cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 3
        button.setTitle("Preview", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 9, weight: .medium)
        button.setTitleColor(.purple, for: .normal)
        return button
    }()
    
    private let courseTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
        
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(collectionViewImage)
        contentView.addSubview(previewButton)
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
        
    public func configureCell(with imageName: String){
        collectionViewImage.image = UIImage(named: imageName)
    }
    
    private func applyConstraints(){
        
        let collectionViewImageConstraints: [NSLayoutConstraint] = [
            collectionViewImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionViewImage.widthAnchor.constraint(equalToConstant: contentView.frame.size.width),
            collectionViewImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionViewImage.heightAnchor.constraint(equalToConstant: contentView.frame.size.height / 3 + 10)
        ]
        
        let previewButtonConstraints: [NSLayoutConstraint] = [
            previewButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            previewButton.widthAnchor.constraint(equalToConstant: 80),
            previewButton.heightAnchor.constraint(equalToConstant: 20),
            previewButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        
        ]
        
        NSLayoutConstraint.activate(collectionViewImageConstraints)
        NSLayoutConstraint.activate(previewButtonConstraints)
        
        
        
    }
    
    
}
