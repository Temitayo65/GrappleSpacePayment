//
//  HomeSearchBarTableViewCell.swift
//  GrappleSpace
//
//  Created by ADMIN on 02/12/2022.
//

import UIKit

class HomeSearchBarTableViewCell: UITableViewCell {

    static let identifier = "HomeSearchBarTableViewCell"
    
    private let homeSearchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = .minimal
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.9)
        contentView.addSubview(homeSearchBar)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        applyConstraints()
    }
    
    private func applyConstraints(){
        let homeSearchBarConstraints: [NSLayoutConstraint] = [
            homeSearchBar.centerXAnchor.constraint(equalTo: centerXAnchor),
            homeSearchBar.topAnchor.constraint(equalTo: topAnchor),
            homeSearchBar.bottomAnchor.constraint(equalTo: bottomAnchor),
            homeSearchBar.widthAnchor.constraint(equalToConstant: 298)
        ]
        NSLayoutConstraint.activate(homeSearchBarConstraints)
    }
    
    public func setPlaceholderText(with title: String){
        homeSearchBar.placeholder = title
    }
   
    

}
