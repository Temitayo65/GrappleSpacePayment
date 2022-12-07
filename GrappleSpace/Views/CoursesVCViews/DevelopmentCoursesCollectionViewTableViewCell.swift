//
//  DevelopmentCoursesCollectionViewTableViewCell.swift
//  GrappleSpace
//
//  Created by ADMIN on 07/12/2022.
//

import UIKit

class DevelopmentCoursesCollectionViewTableViewCell: UITableViewCell {

    static let identifier = "DevelopmentCoursesCollectionViewTableViewCell"
    
    private let developmentCourses: [CoursesCollectionViewCellModel] = [
        CoursesCollectionViewCellModel(courseTitle: "Python Programming", courseImageName: "phytonprogramhome"),
        CoursesCollectionViewCellModel(courseTitle: "Front End Web Development", courseImageName: "frontendhome"),
        CoursesCollectionViewCellModel(courseTitle: "Structured Query Language", courseImageName: "sqlhome"),
        CoursesCollectionViewCellModel(courseTitle: "Back End Development", courseImageName: "backendhome"),
        CoursesCollectionViewCellModel(courseTitle: "Full Stack Web Development", courseImageName: "fullstackhome")
    ]
    

    private let developmentCoursesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 267, height: 249)
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(DevelopmentCoursesCollectionViewCell.self, forCellWithReuseIdentifier: DevelopmentCoursesCollectionViewCell.identifier)
        collectionView.isScrollEnabled = true
        collectionView.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.9)
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(developmentCoursesCollectionView)
        developmentCoursesCollectionView.delegate = self
        developmentCoursesCollectionView.dataSource = self
    }
   
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        developmentCoursesCollectionView.frame = bounds
    }
}


extension DevelopmentCoursesCollectionViewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return developmentCourses.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DevelopmentCoursesCollectionViewCell.identifier, for: indexPath) as? DevelopmentCoursesCollectionViewCell else{return UICollectionViewCell()}
        cell.configureCell(with: developmentCourses[indexPath.row])
        cell.clipsToBounds = true
        cell.layer.cornerRadius = 6
        return cell
    }

}
