//
//  SearchViewController.swift
//  GrappleSpace
//
//  Created by ADMIN on 29/11/2022.
//

import UIKit

class SearchViewController: UIViewController {

    private let searchTableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.separatorStyle = .none
        table.showsVerticalScrollIndicator = false

        
        table.register(TopSearchCollectionViewTableViewCell.self, forCellReuseIdentifier: TopSearchCollectionViewTableViewCell.identifier)
        
        table.register(HomeSearchBarTableViewCell.self, forCellReuseIdentifier: HomeSearchBarTableViewCell.identifier)
        
        table.register(SearchPictureViewTableViewCell.self, forCellReuseIdentifier: SearchPictureViewTableViewCell.identifier)
        
        
        table.isScrollEnabled = true
        table.keyboardDismissMode = .onDrag
        table.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.9)
        
        
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Search"
        navigationController?.navigationBar.prefersLargeTitles = true
        //let attrs = [
        //    NSAttributedString.Key.foregroundColor: UIColor.blue,
        //    NSAttributedString.Key.font: UIFont(name: "SFProDisplay-HeavyItalic", size: 22)!
       // ]
        //UINavigationBar.appearance().titleTextAttributes = attrs
        
        //navigationController?.navigationItem.largeTitleDisplayMode = .always
    
        view.backgroundColor =  UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.9)
        view.addSubview(searchTableView)
        
        searchTableView.delegate = self
        searchTableView.dataSource = self
        
        configureNavBar()
        
        hideKeyboardWhenTappedAround()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        applyConstraints()
    }
    
    private func configureNavBar(){
       // nothing to put on the navigation bar for now
    }
    
    func applyConstraints(){
        let homeTableViewConstraints: [NSLayoutConstraint] = [
            searchTableView.topAnchor.constraint(equalTo: view.topAnchor),
            searchTableView.bottomAnchor.constraint(equalTo: tabBarController!.tabBar.topAnchor, constant: -1),
            searchTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            searchTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ]
        NSLayoutConstraint.activate(homeTableViewConstraints)
        
    }
    
    
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource{
    
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
            cell.setPlaceholderText(with: "Search Courses")
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TopSearchCollectionViewTableViewCell.identifier, for: indexPath) as? TopSearchCollectionViewTableViewCell else{return UITableViewCell()}
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchPictureViewTableViewCell.identifier, for: indexPath) as? SearchPictureViewTableViewCell else{return UITableViewCell()}
            return cell
            
        default:
            return UITableViewCell()
        }
        
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section{
        case 0:
            return 60
        case 1:
            return 70
        case 2:
            return 302
        default:
            return 250
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section{
        case 0:
            return "Find the best course made just\nfor you "
        case 1:
            return "Top Search"
        case 2:
            return nil
        default:
            return nil
        }
        
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        switch section{
        case 0:
            if let headerView = view as? UITableViewHeaderFooterView {
                headerView.textLabel?.textAlignment = .center
                headerView.textLabel?.textColor = UIColor(red: 0.13, green: 0.01, blue: 0.27, alpha: 1)
                headerView.textLabel?.text = headerView.textLabel?.text?.capitalized
                headerView.textLabel?.font = UIFont(name: "SFProDisplay-Bold", size: 12)}
        case 1:
            if let headerView = view as? UITableViewHeaderFooterView {
                headerView.textLabel?.textAlignment = .left
                headerView.textLabel?.textColor = UIColor(red: 0.29, green: 0.20, blue: 0.42, alpha: 1)
                headerView.textLabel?.text = headerView.textLabel?.text?.capitalized
                headerView.textLabel?.font = UIFont(name: "SFProDisplay-Bold", size: 12)}
        case 2:
            if let headerView = view as? UITableViewHeaderFooterView {
                headerView.textLabel?.textAlignment = .left
                headerView.textLabel?.textColor = UIColor(red: 0.29, green: 0.20, blue: 0.42, alpha: 1)
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
