//
//  TopSearchCollectionViewCell.swift
//  GrappleSpace
//
//  Created by ADMIN on 30/11/2022.
//

import UIKit

class TopSearchCollectionViewCell: UICollectionViewCell {
    static let identifier = "TopSearchCollectionViewCell"
    
    private let courseButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.backgroundColor = UIColor(red: 1.0, green: 0.87, blue: 0.72, alpha: 0.19)
        button.layer.backgroundColor = UIColor(red: 1.0, green: 0.87, blue: 0.72, alpha: 0.19).cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        button.layer.borderColor = CGColor(red: 1.0, green: 0.87, blue: 0.72, alpha: 0.19)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isEnabled = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .clear
        contentView.addSubview(courseButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        applyConstraints()
        
    }
    
    private func applyConstraints(){
        let courseButtonConstraints: [NSLayoutConstraint] = [
            courseButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            courseButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 2),
            courseButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -2),
        ]
        NSLayoutConstraint.activate(courseButtonConstraints)

    }
    
    public func configure(with name: String){
        courseButton.setTitle(name, for: .normal)
        courseButton.titleLabel?.numberOfLines = 0
        courseButton.setTitleColor(.black, for: .normal)
        courseButton.titleLabel?.font = UIFont.systemFont(ofSize: 10, weight: .medium)
        courseButton.titleLabel?.textAlignment = .center
        courseButton.titleLabel?.font = UIFont.italicSystemFont(ofSize: 9)
    }
        
    
}
