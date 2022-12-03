//
//  HomeViewController.swift
//  GrappleSpace
//
//  Created by ADMIN on 29/11/2022.
//

import UIKit

class HomeViewController: UIViewController {

    private let homeTableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.separatorStyle = .none
        table.showsVerticalScrollIndicator = false
        
        table.register(TopSearchCollectionViewTableViewCell.self, forCellReuseIdentifier: TopSearchCollectionViewTableViewCell.identifier)
        
        table.register(HomeCourseCollectionViewTableViewCell.self, forCellReuseIdentifier: HomeCourseCollectionViewTableViewCell.identifier)
        
        table.register(HomePictureViewTableViewCell.self, forCellReuseIdentifier: HomePictureViewTableViewCell.identifier)
        
        table.register(HomeSearchBarTableViewCell.self, forCellReuseIdentifier: HomeSearchBarTableViewCell.identifier)
        table.isScrollEnabled = true
        table.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.9)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor =  UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.9)
        view.addSubview(homeTableView)
        
        homeTableView.delegate = self
        homeTableView.dataSource = self
        
        configureNavBar()
        
        hideKeyboardWhenTappedAround()
//        Font family names check
//        for family in UIFont.familyNames.sorted() {
//            let names = UIFont.fontNames(forFamilyName: family)
//            print("Family: \(family) Font names: \(names)")
//        }
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        applyConstraints()
    }
    
    private func configureNavBar(){
        var image = UIImage(named: "femaleavatar")
        image = image?.withRenderingMode(.alwaysOriginal)
        let firstButtonItem = UIBarButtonItem(title: nil, image: image, target: self, action: nil)
        let secondButtonItem = UIBarButtonItem(title: "Hi Olawunmi",image: nil, target: self, action: nil)
        let tempButtonItem =  UIBarButtonItem(title: "                                          ",image: nil, target: self, action: nil)
        let buttonItems: [UIBarButtonItem] = [
            firstButtonItem,secondButtonItem,tempButtonItem
        ] // Find a way to refactor the code above for the navbar
                                              // The Olawunmi usernames should also be set from account login
        navigationItem.leftBarButtonItems = buttonItems
        
        navigationController?.navigationBar.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.9)
    }
    
    func applyConstraints(){
        let homeTableViewConstraints: [NSLayoutConstraint] = [
            homeTableView.topAnchor.constraint(equalTo: view.topAnchor),
            homeTableView.bottomAnchor.constraint(equalTo: tabBarController!.tabBar.topAnchor, constant: -1),
            homeTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            homeTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ]
        NSLayoutConstraint.activate(homeTableViewConstraints)
        
    }
    
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section{
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HomePictureViewTableViewCell.identifier, for: indexPath) as? HomePictureViewTableViewCell else{return UITableViewCell()}
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeSearchBarTableViewCell.identifier, for: indexPath) as? HomeSearchBarTableViewCell else{return UITableViewCell()}
            cell.setPlaceholderText(with: "Search Courses")
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TopSearchCollectionViewTableViewCell.identifier, for: indexPath) as? TopSearchCollectionViewTableViewCell else{return UITableViewCell()}
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeCourseCollectionViewTableViewCell.identifier, for: indexPath) as? HomeCourseCollectionViewTableViewCell else{return UITableViewCell()}
            return cell
        default:
            return UITableViewCell()
        }
        
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section{
        case 0:
            return 100
        case 1:
            return 30
        case 2:
            return 70
        case 3:
            return 200
        default:
            return 250
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section{
        case 0:
            return "Find the course \nmade just for you "
        case 1:
            return "Search"
        case 2:
            return "Top Searches"
        case 3:
            return "Courses You Might Consider"
        default:
            return nil
        }
        
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        switch section{
        case 0:
            if let headerView = view as? UITableViewHeaderFooterView {
                headerView.textLabel?.textAlignment = .left
                headerView.textLabel?.textColor = UIColor(red: 0.29, green: 0.20, blue: 0.42, alpha: 1)
                headerView.textLabel?.text = headerView.textLabel?.text?.capitalized
                headerView.textLabel?.font = UIFont(name: "SFProDisplay-HeavyItalic", size: 14)}
            
        case 1:
            if let headerView = view as? UITableViewHeaderFooterView {
                headerView.textLabel?.textAlignment = .left
                headerView.textLabel?.textColor = UIColor(red: 0.29, green: 0.20, blue: 0.42, alpha: 1)
                headerView.textLabel?.text = headerView.textLabel?.text?.capitalized
                headerView.textLabel?.font = UIFont(name: "SFProDisplay-HeavyItalic", size: 12)}
        case 2:
            if let headerView = view as? UITableViewHeaderFooterView {
                headerView.textLabel?.textAlignment = .left
                headerView.textLabel?.textColor = UIColor(red: 0.29, green: 0.20, blue: 0.42, alpha: 1)
                headerView.textLabel?.text = headerView.textLabel?.text?.capitalized
                headerView.textLabel?.font = UIFont(name: "SFProDisplay-Bold", size: 12)}
            
        case 3:
            if let headerView = view as? UITableViewHeaderFooterView {
                headerView.textLabel?.textAlignment = .center
                headerView.textLabel?.textColor = UIColor(red: 0.13, green: 0.01, blue: 0.27, alpha: 1)
                headerView.textLabel?.text = headerView.textLabel?.text?.capitalized
                headerView.textLabel?.font = UIFont(name: "SFProDisplay-Bold", size: 12)}
            
        default:
            if let headerView = view as? UITableViewHeaderFooterView {
                headerView.textLabel?.textAlignment = .center
                headerView.textLabel?.textColor = .black
                headerView.textLabel?.text = headerView.textLabel?.text?.capitalized
                headerView.textLabel?.font = UIFont(name: "SFProDisplay-Bold", size: 12)}
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaultOffset = view.safeAreaInsets.top
        let offset = scrollView.contentOffset.y + defaultOffset
        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0,-offset))
        //implementation for navBar move with scroll
    }
}



// Mark:- For ViewController Keyboard Removal

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
