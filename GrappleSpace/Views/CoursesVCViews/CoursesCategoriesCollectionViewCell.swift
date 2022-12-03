//
//  CoursesCategoriesCollectionViewCell.swift
//  GrappleSpace
//
//  Created by ADMIN on 03/12/2022.
//

import UIKit

class CoursesCategoriesCollectionViewCell: UICollectionViewCell {
    static let identifier = "CoursesCategoriesCollectionViewCell"
    
    
    private let categoriesButton: UIButton = {        
        let button = UIButton(frame: .zero)
        button.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.9)
        
        button.layer.borderWidth = 0.2
        button.layer.cornerRadius = 3
        button.layer.borderColor = UIColor(red: 0.75, green: 0.25, blue: 0.75, alpha: 1).cgColor
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = true
        button.addTarget(nil, action: #selector(CoursesCategoriesCollectionViewTableViewCell.categoryButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.9)
        contentView.addSubview(categoriesButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        applyConstraints()
        
    }
    
    private func applyConstraints(){
        let categoriesButtonConstraints: [NSLayoutConstraint] = [
            categoriesButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            categoriesButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 2),
            categoriesButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -2),
        ]
        NSLayoutConstraint.activate(categoriesButtonConstraints)

    }
    
    public func configure(with name: String, for dictValue: Bool){
        categoriesButton.setTitle(name, for: .normal)
        categoriesButton.setTitleColor(.purple, for: .normal)
        categoriesButton.titleLabel?.numberOfLines = 0
        categoriesButton.titleLabel?.font = UIFont.systemFont(ofSize: 10, weight: .medium)
        categoriesButton.titleLabel?.textAlignment = .center
        categoriesButton.titleLabel?.font = UIFont.italicSystemFont(ofSize: 9)
        if dictValue{
            categoriesButton.backgroundColor = .purple
            categoriesButton.setTitleColor(.white, for: .normal)
        }
        else{
            categoriesButton.backgroundColor = .clear
            categoriesButton.setTitleColor(.purple, for: .normal)
        }
        
    }
    
        
}
