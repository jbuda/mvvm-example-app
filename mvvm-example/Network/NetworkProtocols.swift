//
//  NetworkProtocols.swift
//  mvvm-example
//
//  Created by Janusz on 01/06/2018.
//  Copyright © 2018 Janusz. All rights reserved.
//

import Foundation

protocol NetworkSession {
  func load(from url:URL,completionHandler:@escaping (Data?,Error?) -> Void)
}

extension URLSession:NetworkSession {
  func load(from url: URL, completionHandler: @escaping (Data?, Error?) -> Void) {
    let task = dataTask(with: url) { (data,_,error) in
      completionHandler(data,error)
    }
    
    task.resume()
  }
}
