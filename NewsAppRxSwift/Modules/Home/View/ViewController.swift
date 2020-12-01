//
//  ViewController.swift
//  NewsAppRxSwift
//
//  Created by Alan Silva on 29/11/20.
//  Copyright © 2020 Alan Silva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var mainTableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    private var viewModel: HomeViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUp()
        setConstraints()
        populateNews()
        
    }
    
    private func setUp() {
        
        viewModel = HomeViewModel()
        
        self.view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Good News"
        //navigationController?.navigationBar.titleTextAttributes =
        
        //mainTableView.delegate = self
        
    }
    
    private func setConstraints() {
        
        view.addSubview(mainTableView)
        
        NSLayoutConstraint.activate([
            mainTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            mainTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            mainTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            mainTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
        
    }
    
    private func populateNews() {
        
        viewModel?.getNews()
        
    }
    
}

