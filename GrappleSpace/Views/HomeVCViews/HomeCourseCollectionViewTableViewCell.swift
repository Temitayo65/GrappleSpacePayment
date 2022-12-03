//
//  HomeCourseCollectionViewTableViewCell.swift
//  GrappleSpace
//
//  Created by ADMIN on 29/11/2022.
//

import UIKit

class HomeCourseCollectionViewTableViewCell: UITableViewCell {
    
    static let identifier = "HomeCourseCollectionViewTableViewCell"
    private let courses: [HomeCollectionViewCellModel] = [
        HomeCollectionViewCellModel(courseTitle: "Python Programming", courseImageName: "phytonprogramhome"),
        HomeCollectionViewCellModel(courseTitle: "Front End Web Development", courseImageName: "frontendhome"),
        HomeCollectionViewCellModel(courseTitle: "Structured Query Language", courseImageName: "sqlhome"),
        HomeCollectionViewCellModel(courseTitle: "Back End Development", courseImageName: "backendhome"),
        HomeCollectionViewCellModel(courseTitle: "User Interface | User Experience", courseImageName: "uiuxhome"),
        HomeCollectionViewCellModel(courseTitle: "Graphic Design", courseImageName: "graphicsdesignhome"),
        HomeCollectionViewCellModel(courseTitle: "Computer Aided Designs", courseImageName: "computeraidedhome"),
        HomeCollectionViewCellModel(courseTitle: "Full Stack Web Development", courseImageName: "fullstackhome"),
        HomeCollectionViewCellModel(courseTitle: "Video Animation", courseImageName: "videoanimationhome")
    ]
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 140, height: 200)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.9)
        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collection.showsHorizontalScrollIndicator = false 
        return collection
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
        cell.configureCell(with: courses[indexPath.row])
        cell.clipsToBounds = true
        cell.layer.cornerRadius = 6
        return cell

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  courses.count
        
    }
}
