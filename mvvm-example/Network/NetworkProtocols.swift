//
//  NetworkProtocols.swift
//  mvvm-example
//
//  Created by Janusz on 01/06/2018.
//  Copyright © 2018 Janusz. All rights reserved.
//

import Foundation

typealias ConnectionResult = (data:Data?,response:URLResponse?,error:Error?)

protocol URLSessionProtocol {
  func fetch(with request:URL, completion completionHandler:@escaping (ConnectionResult) -> Void)
}

extension URLSession:URLSessionProtocol {
  
  func fetch(with request:URL, completion completionHandler:@escaping (ConnectionResult) -> Void) {
    let task = dataTask(with: request) { data,response,error in
      completionHandler(ConnectionResult(data,response,error))
    }
    
    task.resume()
  }
}
