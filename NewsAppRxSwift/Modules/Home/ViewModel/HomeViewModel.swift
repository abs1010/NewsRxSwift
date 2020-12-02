//
//  HomeViewModel.swift
//  NewsAppRxSwift
//
//  Created by Alan Silva on 30/11/20.
//  Copyright © 2020 Alan Silva. All rights reserved.
//

import Foundation

protocol HomeViewModelDelegate {
    func requestSuccess(_ news: News)
    func requestFailure(_ error: errorTypes)
}

class HomeViewModel {
    
    var apiService: ApiService?
    var delegate: HomeViewModelDelegate?
    
    func getNews() {
        
        apiService = ApiService()
        
        apiService?.getNews(completion: { [unowned self] result in
            
            switch result {
            case .success(let _news):
                self.delegate?.requestSuccess(_news)
            case .failure(let error):
                self.delegate?.requestFailure(error)
            }
            
        })
        
    }
    
}
