//
//  CoursesCategoriesCollectionViewTableViewCell.swift
//  GrappleSpace
//
//  Created by ADMIN on 03/12/2022.
//

import UIKit

class CoursesCategoriesCollectionViewTableViewCell: UITableViewCell {

    static let identifier = "CoursesCategoriesCollectionViewTableViewCell"
    
    private let categories = ["All", "📈Trending", "Design", "</>Development"]
    private var highlightValue: Bool = false
    private var categoriesDict: [String: Bool] = ["All": true, "📈Trending": false, "Design": false, "</>Development": false]
    
    private let courseCategoriesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 80, height: 30)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CoursesCategoriesCollectionViewCell.self, forCellWithReuseIdentifier: CoursesCategoriesCollectionViewCell.identifier)
        collectionView.isScrollEnabled = true
        collectionView.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.9)
        collectionView.showsHorizontalScrollIndicator = false 
        return collectionView
    }()
    
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(courseCategoriesCollectionView)
        courseCategoriesCollectionView.delegate = self
        courseCategoriesCollectionView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        courseCategoriesCollectionView.frame = bounds
    }

}

extension CoursesCategoriesCollectionViewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CoursesCategoriesCollectionViewCell.identifier, for: indexPath) as? CoursesCategoriesCollectionViewCell else{return UICollectionViewCell()}
        let currentCategory = categories[indexPath.row]
        highlightValue = categoriesDict[currentCategory] ?? false
        cell.configure(with: currentCategory, for: highlightValue)
        return cell
    }
    
    @objc func categoryButtonTapped(with sender: UIButton){
        if let sender = sender.titleLabel?.text{
            categoriesDict[sender] = true
            switch sender{
            case "All":
                setRemainingDictValuesFalse(for: categoriesDict, with: sender)
            case "📈Trending":
                setRemainingDictValuesFalse(for: categoriesDict, with: sender)
            case "Design":
                setRemainingDictValuesFalse(for: categoriesDict, with: sender)
                self.courseCategoriesCollectionView.reloadData()
            case "</>Development":
                setRemainingDictValuesFalse(for: categoriesDict, with: sender)
                self.courseCategoriesCollectionView.reloadData()
            default:
                categoriesDict[sender] = false
                self.courseCategoriesCollectionView.reloadData()
                
            }
        }
    }
    
    func setRemainingDictValuesFalse(for dictionary: [String: Bool], with key: String){
        for item in categoriesDict{
            if item.key != key{
                categoriesDict[item.key] = false
            }
        }
        self.courseCategoriesCollectionView.reloadData()
    }


}
