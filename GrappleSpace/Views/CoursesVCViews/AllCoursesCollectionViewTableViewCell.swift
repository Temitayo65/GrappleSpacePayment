//
//  AllCoursesCollectionViewTableViewCell.swift
//  GrappleSpace
//
//  Created by ADMIN on 02/12/2022.
//

import UIKit

class AllCoursesCollectionViewTableViewCell: UITableViewCell {
    
    static let identifier = "AllCoursesCollectionViewTableViewCell"
    
    private let courses: [CoursesCollectionViewCellModel] = [
        CoursesCollectionViewCellModel(courseTitle: "User Interface | User Experience", courseImageName: "uiuxhome"),
        CoursesCollectionViewCellModel(courseTitle: "Python Programming", courseImageName: "phytonprogramhome"),
        CoursesCollectionViewCellModel(courseTitle: "Front End Web Development", courseImageName: "frontendhome"),
        CoursesCollectionViewCellModel(courseTitle: "Structured Query Language", courseImageName: "sqlhome"),
        CoursesCollectionViewCellModel(courseTitle: "Back End Development", courseImageName: "backendhome"),
        CoursesCollectionViewCellModel(courseTitle: "Graphic Design", courseImageName: "graphicsdesignhome"),
        CoursesCollectionViewCellModel(courseTitle: "Computer Aided Designs", courseImageName: "computeraidedhome"),
        CoursesCollectionViewCellModel(courseTitle: "Full Stack Web Development", courseImageName: "fullstackhome"),
        CoursesCollectionViewCellModel(courseTitle: "Video Animation", courseImageName: "videoanimationhome"),
        CoursesCollectionViewCellModel(courseTitle: "User Interface | User Experience", courseImageName: "uiuxhome"),
        CoursesCollectionViewCellModel(courseTitle: "Python Programming", courseImageName: "phytonprogramhome")
    ]
    
    private let allCouresesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 170, height: 250)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.9)
        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collection.showsHorizontalScrollIndicator = false
        collection.showsVerticalScrollIndicator = false
        return collection
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(allCouresesCollectionView)
        allCouresesCollectionView.register(AllCoursesCollectionViewCell.self, forCellWithReuseIdentifier: AllCoursesCollectionViewCell.identifier)
        
        allCouresesCollectionView.delegate = self
        allCouresesCollectionView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        allCouresesCollectionView.frame = contentView.bounds
        
    }

}

extension AllCoursesCollectionViewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AllCoursesCollectionViewCell.identifier, for: indexPath) as? AllCoursesCollectionViewCell else{return UICollectionViewCell()}
        cell.configureCell(with: courses[indexPath.row])
        cell.clipsToBounds = true
        cell.layer.cornerRadius = 6
        return cell

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  courses.count
        
    }


}
