//
//  NetworkSessionMock.swift
//  mvvm-exampleTests
//
//  Created by Janusz on 01/06/2018.
//  Copyright © 2018 Janusz. All rights reserved.
//

import Foundation

@testable import mvvm_example

class NetworkSessionMock:NetworkSession {
  var data:Data?
  var error:Error?
  
  func load(from url: URL, completionHandler: @escaping (Data?, Error?) -> Void) {
    completionHandler(data,error)
  }
}
