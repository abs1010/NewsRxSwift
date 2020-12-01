//
//  HomeViewModel.swift
//  NewsAppRxSwift
//
//  Created by Alan Silva on 30/11/20.
//  Copyright © 2020 Alan Silva. All rights reserved.
//

import Foundation

class HomeViewModel {
    
    var apiService: ApiService?
    
    func getNews() {
        
        apiService = ApiService()
        
        apiService?.getNews(completion: { [unowned self] result in
            
            switch result {
            case .success(let _news):
                print(_news)
            case .failure(let error):
                print(error)
            }
            
        })
        
    }
    
}
