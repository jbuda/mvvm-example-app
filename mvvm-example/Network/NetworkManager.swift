//
//  NetworkManager.swift
//  mvvm-example
//
//  Created by Janusz on 01/06/2018.
//  Copyright © 2018 Janusz. All rights reserved.
//

import Foundation

enum NetworkResult<T> {
  case success(T?)
  case failure
}

class NetworkManager {
  
  let session:URLSessionProtocol
  
  init(session:URLSessionProtocol = URLSession.shared) {
    self.session = session
  }
  
  func get<T:Decodable>(from request:URL,type decoding:T.Type, completion completionHandler:@escaping (NetworkResult<T>) -> Void) {
    session.fetch(with: request) { (result:ConnectionResult) in
      
      guard let response = result.response as? HTTPURLResponse else {
        completionHandler(NetworkResult.failure)
        return
      }
      
      if 200 ..< 300 ~= response.statusCode {        
        
        guard let data = result.data else {
          completionHandler(NetworkResult.failure)
          return
        }
        
        do {
          let json = try JSONDecoder().decode(decoding, from: data)
          
          completionHandler(NetworkResult.success(json))
        } catch {
          completionHandler(NetworkResult.failure)
        }
      } else {
        completionHandler(NetworkResult.failure)
      }
      
    }
  }
}
