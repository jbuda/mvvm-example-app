//
//  ResultsViewModel.swift
//  mvvm-example
//
//  Created by Janusz on 01/06/2018.
//  Copyright © 2018 Janusz. All rights reserved.
//

import Foundation

class ResultsViewModel {
  
  lazy var networkService:NetworkManager = {
    return NetworkManager()
  }()
  
  var searchTerm:String
  
  init(with search:String) {
    searchTerm = search
  }
  
  func fetch() {
    let url = "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=__&text=\(searchTerm)&format=json&nojsoncallback=?"
   
    networkService.get(from: URL(string: url)!, type: Photos.self) {
        print($0)
    }
  }
  
}
