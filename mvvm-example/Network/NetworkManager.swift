//
//  NetworkManager.swift
//  mvvm-example
//
//  Created by Janusz on 01/06/2018.
//  Copyright © 2018 Janusz. All rights reserved.
//

import Foundation

enum NetworkResult {
  case success(Data)
  case failure
}

class NetworkManager {
  
  private let session:NetworkSession
  
  init(session:NetworkSession = URLSession.shared) {
    self.session = session
  }
  
  func load(from url:URL,completionHandler:@escaping (NetworkResult) -> Void) {
    session.load(from: url) { data,error in
      
      let result = data.map(NetworkResult.success) ?? .failure
      
      completionHandler(result)
    }
  }
}
