//
//  TrendingCoursesCollectionViewTableViewCell.swift
//  GrappleSpace
//
//  Created by ADMIN on 05/12/2022.
//

import UIKit

class TrendingCoursesCollectionViewTableViewCell: UITableViewCell {
    static let identifier = "TrendingCoursesCollectionViewTableViewCell"
    
    private let trendingCourses: [CoursesCollectionViewCellModel] = [
        CoursesCollectionViewCellModel(courseTitle: "User Interface | User Experience", courseImageName: "uiuxhome"),
        CoursesCollectionViewCellModel(courseTitle: "Front End Web Development", courseImageName: "frontendhome"),
        CoursesCollectionViewCellModel(courseTitle: "Graphic Design", courseImageName: "graphicsdesignhome"),
        CoursesCollectionViewCellModel(courseTitle: "Computer Aided Designs", courseImageName: "computeraidedhome"),
        CoursesCollectionViewCellModel(courseTitle: "Video Animation", courseImageName: "videoanimationhome"),
        CoursesCollectionViewCellModel(courseTitle: "User Interface | User Experience", courseImageName: "uiuxhome")
    ]
    

    private let trendingCoursesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 267, height: 249)
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(TrendingCoursesCollectionViewCell.self, forCellWithReuseIdentifier: TrendingCoursesCollectionViewCell.identifier)
        collectionView.isScrollEnabled = true
        collectionView.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.9)
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(trendingCoursesCollectionView)
        trendingCoursesCollectionView.delegate = self
        trendingCoursesCollectionView.dataSource = self
    }
   
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        trendingCoursesCollectionView.frame = bounds 
    }
}


extension TrendingCoursesCollectionViewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trendingCourses.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TrendingCoursesCollectionViewCell.identifier, for: indexPath) as? TrendingCoursesCollectionViewCell else{return UICollectionViewCell()}
        cell.configureCell(with: trendingCourses[indexPath.row])
        cell.clipsToBounds = true
        cell.layer.cornerRadius = 6
        return cell
    }
    
    
    
}
