//
//  ViewController.swift
//  NewsAppRxSwift
//
//  Created by Alan Silva on 29/11/20.
//  Copyright © 2020 Alan Silva. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {
    
    var mainTableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private var viewModel: HomeViewModel?
    private var newsArray = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUp()
        setConstraints()
        populateNews()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        mainTableView.estimatedRowHeight = 100
        mainTableView.rowHeight = UITableView.automaticDimension

    }
    
    private func setUp() {
        
        mainTableView.register(NewsTableViewCell.self, forCellReuseIdentifier: NewsTableViewCell.cellID)
        
        viewModel = HomeViewModel()
        viewModel?.delegate = self
        
        self.view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Good News"
        //navigationController?.navigationBar.titleTextAttributes =
        
        mainTableView.dataSource = self
        
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

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.cellID, for: indexPath) as! NewsTableViewCell
        let cell = NewsTableViewCell(style: .default, reuseIdentifier: NewsTableViewCell.cellID)
        
        let index = newsArray[indexPath.row]
        
        cell.title.text = index.title
        cell.textDescription.text = index.articleDescription
        
        return cell
        
    }
    
}

extension NewsViewController: HomeViewModelDelegate {
    
    func requestSuccess(_ news: News) {
        self.newsArray = news.articles ?? []
        
        DispatchQueue.main.async {
            self.mainTableView.reloadData()
        }
        
    }
    
    func requestFailure(_ error: errorTypes) {
        print(error)
    }
    
}

