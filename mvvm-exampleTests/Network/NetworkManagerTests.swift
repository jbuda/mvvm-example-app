//
//  NetworkManagerTests.swift
//  mvvm-exampleTests
//
//  Created by Janusz on 01/06/2018.
//  Copyright © 2018 Janusz. All rights reserved.
//

import XCTest

@testable import mvvm_example

class NetworkManagerTests: XCTestCase {
    
  func testSuccessfulResponse() {
    let session = NetworkSessionMock()
    let manager = NetworkManager(session:session)
    
    let data = Data(bytes:[0,1,0,1])
    session.data = data
    
    let url = URL(fileURLWithPath: "")
    
    var result:NetworkResult?
    manager.load(from: url) { result = $0 }
    
    if case NetworkResult.success = result! { }
    else {
      XCTAssertTrue(false,"error")
    }
  }
    
}
