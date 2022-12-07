//
//  CoursesCategoriesCollectionViewTableViewCell.swift
//  GrappleSpace
//
//  Created by ADMIN on 03/12/2022.
//

import UIKit
protocol TitleManager{
    func didUpdateTitle(with title: String)
}

class CoursesCategoriesCollectionViewTableViewCell: UITableViewCell, ButtonDataManager {
    //Try the ButtonManagerDelegate and create the trendingcoursecollectionviewcell
    
    private var activeButtonTitle = "All"
    var delegate: TitleManager?
//
//    public func getActiveButtonTitle()-> String{
//        return activeButtonTitle
//    }
    static let identifier = "CoursesCategoriesCollectionViewTableViewCell"
    
    private let courseCategories = ["All", "📈Trending", "Design", "</>Development"]
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
    
    func didGetCurrentTappedButtonCategory(for button: UIButton) {
        activeButtonTitle = button.titleLabel?.text ?? "All" // this sets the active button title that has been clicked 
        delegate?.didUpdateTitle(with: activeButtonTitle) // this method is surely called and is dependent on making the cell the delegator when dequeueing the collectionview
        // this also help pass the activeButtonTitle to the CourseViewController
    }
    

}

extension CoursesCategoriesCollectionViewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return courseCategories.count
        
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CoursesCategoriesCollectionViewCell.identifier, for: indexPath) as? CoursesCategoriesCollectionViewCell else{return UICollectionViewCell()}
            let currentCategory = courseCategories[indexPath.row]
            highlightValue = categoriesDict[currentCategory] ?? false
            cell.configure(with: currentCategory, for: highlightValue)
            cell.delegate = self
            return cell
    }
    
    @objc func categoryButtonTapped(with sender: UIButton){
        if let senderTitle = sender.titleLabel?.text{
            categoriesDict[senderTitle] = true // lets the cell in the dequeued collectionView have a unique property of true so there is no coinciding cell due to dequeue for efficiency
            setRemainingDictValuesFalse(for: categoriesDict, with: senderTitle)
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
