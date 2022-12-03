//
//  TopSearchCollectionViewTableViewCell.swift
//  GrappleSpace
//
//  Created by ADMIN on 02/12/2022.
//

import UIKit

class TopSearchCollectionViewTableViewCell: UITableViewCell {
    
    static let identifier = "TopSearchCollectionViewTableViewCell"
    
    private let topSearches = ["Python Programming", "User Interface | User Experience", "Front End Web Development", "Full Stack Web Development", "Graphic Design", "Animation Design"]
    
    private let topSearchCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 110, height: 30)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(TopSearchCollectionViewCell.self, forCellWithReuseIdentifier: TopSearchCollectionViewCell.identifier)
        collectionView.isScrollEnabled = true
        collectionView.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.9)
        return collectionView
    }()
    
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(topSearchCollectionView)
        topSearchCollectionView.delegate = self
        topSearchCollectionView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        topSearchCollectionView.frame = bounds
    }

}

extension TopSearchCollectionViewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return topSearches.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopSearchCollectionViewCell.identifier, for: indexPath) as? TopSearchCollectionViewCell else{return UICollectionViewCell()}
        cell.configure(with: topSearches[indexPath.row])
        return cell
    }


    
}
