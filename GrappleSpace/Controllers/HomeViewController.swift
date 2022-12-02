//
//  HomeViewController.swift
//  GrappleSpace
//
//  Created by ADMIN on 29/11/2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let topSearches = ["Python Programming", "User Interface | User Experience", "Front End Web Development", "Full Stack Web Development", "Graphic Design", "Animation Design"]
    
    private let userImageView: UIView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "femaleavatar")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let usernameTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .orange
        label.font = UIFont.italicSystemFont(ofSize: 12)
        label.text = "Hi, Olawunmi" // change this later on
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private let headerTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .purple
        label.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        label.text = "Find the course made just for you."
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
        
    }()
    
    private let homepagePictureViewTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Want to get a tech skill? \nTake a look at the course that suits you most."
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.italicSystemFont(ofSize: 12)
        label.textColor = .white
        return label
                
    }()
    
    private let homepagePictureView: UIView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "homepagepicture")
        return imageView
    }()
    
    private let courseSearchBar: UISearchBar = {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.placeholder = "Search Courses"
        searchBar.searchBarStyle = .minimal
        return searchBar
    }()
    
    private let topSearchesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Top Searches"
        label.textColor = UIColor(red: 0.29, green: 0.2, blue: 0.42, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textAlignment = .left
        return label
    }()

    
    private let topSearchCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 110, height: 30)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(TopSearchCollectionViewCell.self, forCellWithReuseIdentifier: TopSearchCollectionViewCell.identifier)
        collectionView.isScrollEnabled = false
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private let homeCourseTableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(HomeCourseCollectionViewTableViewCell.self, forCellReuseIdentifier: HomeCourseCollectionViewTableViewCell.identifier)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.isScrollEnabled = false
        table.separatorColor = .clear
        table.backgroundColor = .clear
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(cgColor: CGColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.9))
        view.addSubview(homeCourseTableView)
        view.addSubview(topSearchCollectionView)
        view.addSubview(topSearchesLabel)
        view.addSubview(courseSearchBar)
        view.addSubview(homepagePictureView)
        view.addSubview(homepagePictureViewTextLabel)
        view.addSubview(headerTitleLabel)
        view.addSubview(usernameTextLabel)
        view.addSubview(userImageView)
        userImageView.layer.cornerRadius = 30
        
        homeCourseTableView.delegate = self
        homeCourseTableView.dataSource = self
        topSearchCollectionView.delegate = self
        topSearchCollectionView.dataSource = self
        
        hideKeyboardWhenTappedAround()

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        applyConstraints()
    }
    
    
    func applyConstraints(){
        let userImageViewConstraints: [NSLayoutConstraint] = [
            userImageView.heightAnchor.constraint(equalToConstant: 60),
            userImageView.widthAnchor.constraint(equalToConstant: 60),
            userImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            userImageView.bottomAnchor.constraint(equalTo: headerTitleLabel.topAnchor, constant: -5)
        ]
        
        let usernameTextLabelConstraints: [NSLayoutConstraint] = [
            usernameTextLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 5),
            usernameTextLabel.centerYAnchor.constraint(equalTo: userImageView.centerYAnchor)
        ]
        
        let homeCourseTableViewConstraints: [NSLayoutConstraint] = [
            homeCourseTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            homeCourseTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            homeCourseTableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            homeCourseTableView.bottomAnchor.constraint(equalTo: tabBarController!.tabBar.topAnchor),
            homeCourseTableView.heightAnchor.constraint(equalToConstant: 290)
        ]
        
        let topSearchCollectionViewConstraints: [NSLayoutConstraint] = [
            topSearchCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            topSearchCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            topSearchCollectionView.bottomAnchor.constraint(equalTo: homeCourseTableView.topAnchor, constant: 10),
            topSearchCollectionView.heightAnchor.constraint(equalToConstant: 70)
        
        ]
        
        let topSearchesLabelConstraints: [NSLayoutConstraint] = [
            topSearchesLabel.bottomAnchor.constraint(equalTo: topSearchCollectionView.topAnchor, constant: -10),
            topSearchesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            topSearchesLabel.widthAnchor.constraint(equalToConstant: 150)
        ]
        
        let courseSearchBarConstraints: [NSLayoutConstraint] = [
            courseSearchBar.bottomAnchor.constraint(equalTo: topSearchesLabel.topAnchor, constant: -10),
            courseSearchBar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            courseSearchBar.widthAnchor.constraint(equalToConstant: 295)
        ]
        
        let homepagePictureViewConstraints: [NSLayoutConstraint] = [
            homepagePictureView.bottomAnchor.constraint(equalTo: courseSearchBar.topAnchor, constant: -10),
            homepagePictureView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            homepagePictureView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            homepagePictureView.heightAnchor.constraint(equalToConstant: 145)
        ]
        
        let homepagePictureViewTextLabelConstraints: [NSLayoutConstraint] = [
            homepagePictureViewTextLabel.topAnchor.constraint(equalTo: homepagePictureView.topAnchor, constant: 45),
            homepagePictureViewTextLabel.trailingAnchor.constraint(equalTo: homepagePictureView.trailingAnchor, constant: -58),
            homepagePictureViewTextLabel.widthAnchor.constraint(equalToConstant: 145)
        ]
        
        let headerTitleLabelConstraints: [NSLayoutConstraint] = [
            headerTitleLabel.bottomAnchor.constraint(equalTo: homepagePictureView.topAnchor, constant: -10),
            headerTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            headerTitleLabel.widthAnchor.constraint(equalToConstant: 145)
        ]
        
        NSLayoutConstraint.activate(homeCourseTableViewConstraints)
        NSLayoutConstraint.activate(topSearchCollectionViewConstraints)
        NSLayoutConstraint.activate(topSearchesLabelConstraints)
        NSLayoutConstraint.activate(courseSearchBarConstraints)
        NSLayoutConstraint.activate(homepagePictureViewConstraints)
        NSLayoutConstraint.activate(homepagePictureViewTextLabelConstraints)
        NSLayoutConstraint.activate(headerTitleLabelConstraints)
        NSLayoutConstraint.activate(usernameTextLabelConstraints)
        NSLayoutConstraint.activate(userImageViewConstraints)
        
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeCourseCollectionViewTableViewCell.identifier, for: indexPath) as? HomeCourseCollectionViewTableViewCell else{return UITableViewCell()}
        return cell
         
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       
        return 250
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Courses You Might Consider"
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.textLabel?.textAlignment = .center
            headerView.textLabel?.textColor = .black
            headerView.textLabel?.text = headerView.textLabel?.text?.capitalized
            headerView.textLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)}
    }
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return topSearches.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopSearchCollectionViewCell.identifier, for: indexPath) as? TopSearchCollectionViewCell else{return UICollectionViewCell()}
        cell.configure(with: topSearches[indexPath.row])
        
        return cell
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
