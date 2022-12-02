//
//  HomeCourseCollectionViewTableViewCell.swift
//  GrappleSpace
//
//  Created by ADMIN on 29/11/2022.
//

import UIKit

class HomeCourseCollectionViewTableViewCell: UITableViewCell {
    
    static let identifier = "HomeCourseCollectionViewTableViewCell"
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 160, height: 200)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collection.register(HomeCourseCollectionViewCell.self, forCellWithReuseIdentifier: HomeCourseCollectionViewCell.identifier)
        collection.backgroundColor = .clear
        return collection
    }()
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor(cgColor: CGColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.9))
        contentView.addSubview(collectionView)
        collectionView.register(HomeCourseCollectionViewCell.self, forCellWithReuseIdentifier: HomeCourseCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }

}

extension HomeCourseCollectionViewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCourseCollectionViewCell.identifier, for: indexPath) as? HomeCourseCollectionViewCell else{return UICollectionViewCell()}
        cell.backgroundColor = .white
        cell.configureCell(with: "frontendhome")
        return cell

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  4
    }
}
