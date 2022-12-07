//
//  DevelopmentCoursesCollectionViewCell.swift
//  GrappleSpace
//
//  Created by ADMIN on 07/12/2022.
//

import UIKit

class DevelopmentCoursesCollectionViewCell: UICollectionViewCell {
    static let identifier = "DevelopmentCoursesCollectionViewCell"

    
    private let collectionViewImage: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .clear
        return imageView
    }()
    
    let registerButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.layer.borderColor = UIColor.purple.cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 3
        button.setTitle("Register", for: .normal)
        button.titleLabel?.font = UIFont(name: "SFProDisplay-HeavyItalic", size: 10)
        button.setTitleColor(.purple, for: .normal)
        button.isEnabled = true
        return button
    }()
    
    private let courseTitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont(name: "SFProDisplay-SemiboldItalic", size: 12)
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(collectionViewImage)
        contentView.addSubview(registerButton)
        contentView.addSubview(courseTitle)
        contentView.backgroundColor = .white
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
        
    public func configureCell(with model: CoursesCollectionViewCellModel){
        collectionViewImage.image = UIImage(named: model.courseImageName)
        courseTitle.text = model.courseTitle
    }
    
    private func applyConstraints(){
        
        let collectionViewImageConstraints: [NSLayoutConstraint] = [
            collectionViewImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionViewImage.widthAnchor.constraint(equalToConstant: contentView.frame.size.width),
            collectionViewImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionViewImage.heightAnchor.constraint(equalToConstant: contentView.frame.size.height / 3 + 10)
        ]
        
        let registerButtonConstraints: [NSLayoutConstraint] = [
            registerButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            registerButton.widthAnchor.constraint(equalToConstant: 80),
            registerButton.heightAnchor.constraint(equalToConstant: 20),
            registerButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        
        ]
        
        let courseTitleConstraints: [NSLayoutConstraint] = [
            courseTitle.bottomAnchor.constraint(equalTo: registerButton.topAnchor, constant: -30),
            courseTitle.widthAnchor.constraint(equalToConstant: 80),
            courseTitle.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
        ]
        
        NSLayoutConstraint.activate(collectionViewImageConstraints)
        NSLayoutConstraint.activate(registerButtonConstraints)
        NSLayoutConstraint.activate(courseTitleConstraints)
        
    }

}
