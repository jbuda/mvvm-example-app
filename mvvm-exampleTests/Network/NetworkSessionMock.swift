//
//  NetworkSessionMock.swift
//  mvvm-exampleTests
//
//  Created by Janusz on 01/06/2018.
//  Copyright © 2018 Janusz. All rights reserved.
//

import Foundation

@testable import mvvm_example

class NetworkSessionMock:URLSessionProtocol {
  
  var data:Data?
  var response:URLResponse?
  var error:Error?
  
  func fetch(with request: URL, completion completionHandler: @escaping (ConnectionResult) -> Void) {
    completionHandler(ConnectionResult(data,response,error))
  }
}
