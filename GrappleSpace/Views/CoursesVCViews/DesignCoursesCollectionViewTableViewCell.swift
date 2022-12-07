//
//  DesignCoursesCollectionViewTableViewCell.swift
//  GrappleSpace
//
//  Created by ADMIN on 06/12/2022.
//

import UIKit

class DesignCoursesCollectionViewTableViewCell: UITableViewCell {

    static let identifier = "DesignCoursesCollectionViewTableViewCell"
    
    private let designCourses: [CoursesCollectionViewCellModel] = [
        CoursesCollectionViewCellModel(courseTitle: "Video Animation", courseImageName: "videoanimationhome"),
        CoursesCollectionViewCellModel(courseTitle: "User Interface | User Experience", courseImageName: "uiuxhome"),
        CoursesCollectionViewCellModel(courseTitle: "Graphic Design", courseImageName: "graphicsdesignhome"),
        CoursesCollectionViewCellModel(courseTitle: "Computer Aided Designs", courseImageName: "computeraidedhome"),
        CoursesCollectionViewCellModel(courseTitle: "Revit", courseImageName: "uiuxhome")
    ]
    

    private let designCoursesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 267, height: 249)
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(DesignCoursesCollectionViewCell.self, forCellWithReuseIdentifier: DesignCoursesCollectionViewCell.identifier)
        collectionView.isScrollEnabled = true
        collectionView.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.9)
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(designCoursesCollectionView)
        designCoursesCollectionView.delegate = self
        designCoursesCollectionView.dataSource = self
    }
   
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        designCoursesCollectionView.frame = bounds
    }
}


extension DesignCoursesCollectionViewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return designCourses.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DesignCoursesCollectionViewCell.identifier, for: indexPath) as? DesignCoursesCollectionViewCell else{return UICollectionViewCell()}
        cell.configureCell(with: designCourses[indexPath.row])
        cell.clipsToBounds = true
        cell.layer.cornerRadius = 6
        return cell
    }
    
}
