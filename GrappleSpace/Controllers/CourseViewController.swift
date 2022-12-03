//
//  CourseViewController.swift
//  GrappleSpace
//
//  Created by ADMIN on 29/11/2022.
//

import UIKit

class CourseViewController: UIViewController {
    

    private let courseTableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.separatorStyle = .none
        table.showsVerticalScrollIndicator = false
        
        table.register(AllCoursesCollectionViewTableViewCell.self, forCellReuseIdentifier: AllCoursesCollectionViewTableViewCell.identifier)
        
        table.register(CoursesCategoriesCollectionViewTableViewCell.self, forCellReuseIdentifier: CoursesCategoriesCollectionViewTableViewCell.identifier)
        
        table.register(HomePictureViewTableViewCell.self, forCellReuseIdentifier: HomePictureViewTableViewCell.identifier)
        
        table.register(HomeSearchBarTableViewCell.self, forCellReuseIdentifier: HomeSearchBarTableViewCell.identifier)
        
        
        table.isScrollEnabled = true
        table.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.9)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor =  UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.9)
        view.addSubview(courseTableView)
        
        courseTableView.delegate = self
        courseTableView.dataSource = self

        title = "Courses"
        let attrs = [
            NSAttributedString.Key.foregroundColor: UIColor.red,
            NSAttributedString.Key.font: UIFont(name: "SFProDisplay-HeavyItalic", size: 22)!
        ]
        UINavigationBar.appearance().titleTextAttributes = attrs
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        
        configureNavBar()
        
        hideKeyboardWhenTappedAround()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        applyConstraints()
    }
    
    private func configureNavBar(){
        var image = UIImage(named: "femaleavatar")
        image = image?.withRenderingMode(.alwaysOriginal)
        let buttonItems: [UIBarButtonItem] = [
            UIBarButtonItem(title: nil, image: image, target: self, action: nil),
        ]
        navigationItem.rightBarButtonItems = buttonItems
        
        navigationController?.navigationBar.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.9)
    }
    
    func applyConstraints(){
        let courseTableViewConstraints: [NSLayoutConstraint] = [
            courseTableView.topAnchor.constraint(equalTo: view.topAnchor),
            courseTableView.bottomAnchor.constraint(equalTo: tabBarController!.tabBar.topAnchor, constant: -1),
            courseTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            courseTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ]
        NSLayoutConstraint.activate(courseTableViewConstraints)
        
    }
    
    
}

extension CourseViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section{
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeSearchBarTableViewCell.identifier, for: indexPath) as? HomeSearchBarTableViewCell else{return UITableViewCell()}
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CoursesCategoriesCollectionViewTableViewCell.identifier, for: indexPath) as? CoursesCategoriesCollectionViewTableViewCell else{return UITableViewCell()}
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: AllCoursesCollectionViewTableViewCell.identifier, for: indexPath) as? AllCoursesCollectionViewTableViewCell else{return UITableViewCell()}
            return cell
        default:
            return UITableViewCell()
        }
        
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section{
        case 0:
            return 30
        case 1:
            return 30
        case 2:
            return 550
        default:
            return 250
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section{
        case 0:
            return "Select a course that suits you best "
        case 1:
            return "Categories"
        case 2:
            return "All Courses" // the onlu section title that mutates
        default:
            return nil
        }
        
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        switch section{
        case 0:
            if let headerView = view as? UITableViewHeaderFooterView {
                headerView.textLabel?.textAlignment = .center
                headerView.textLabel?.textColor = UIColor(red: 0.29, green: 0.20, blue: 0.42, alpha: 1)
                headerView.textLabel?.text = headerView.textLabel?.text?.capitalized
                headerView.textLabel?.font = UIFont(name: "SFProDisplay-HeavyItalic", size: 12)}
            
        case 1:
            if let headerView = view as? UITableViewHeaderFooterView {
                headerView.textLabel?.textAlignment = .left
                headerView.textLabel?.textColor = UIColor(red: 0.29, green: 0.20, blue: 0.42, alpha: 1)
                headerView.textLabel?.text = headerView.textLabel?.text?.capitalized
                headerView.textLabel?.font = UIFont(name: "SFProDisplay-HeavyItalic", size: 14)}
        case 2:
            if let headerView = view as? UITableViewHeaderFooterView {
                headerView.textLabel?.textAlignment = .left
                headerView.textLabel?.textColor = UIColor(red: 0.29, green: 0.20, blue: 0.42, alpha: 1)
                headerView.textLabel?.text = headerView.textLabel?.text?.capitalized
                headerView.textLabel?.font = UIFont(name: "SFProDisplay-BlackItalic", size: 16)}
            
        default:
            if let headerView = view as? UITableViewHeaderFooterView {
                headerView.textLabel?.textAlignment = .center
                headerView.textLabel?.textColor = .black
                headerView.textLabel?.text = headerView.textLabel?.text?.capitalized
                headerView.textLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)}
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaultOffset = view.safeAreaInsets.top
        let offset = scrollView.contentOffset.y + defaultOffset
        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0,-offset))
        //implementation for navBar move with scroll
    }

}

