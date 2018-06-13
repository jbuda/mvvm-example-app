//
//  NetworkManagerTests.swift
//  mvvm-exampleTests
//
//  Created by Janusz on 01/06/2018.
//  Copyright © 2018 Janusz. All rights reserved.
//

import XCTest

@testable import mvvm_example

struct DecodableMock:Decodable {
  let name:String
}

class NetworkManagerTests: XCTestCase {
  
  func testSuccess200StatusCodeResponse() {
    let url = URL(fileURLWithPath: "")
    
    let session = NetworkSessionMock()
    session.response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)
    
    let manager = NetworkManager(session:session)
    
    manager.get(from:url,type:DecodableMock.self) {
      if case .success(_) = $0 { }
      else {
        XCTAssertTrue(false,"Error")
      }
    }
  }
  
  func testFailedResponse() {
    let url = URL(fileURLWithPath: "")

    let session = NetworkSessionMock()
    let manager = NetworkManager(session:session)
    
    manager.get(from: url, type: DecodableMock.self) {
      if case .failure = $0 { }
      else {
        XCTAssertTrue(false,"Error")
      }
    }
  }
  
  func testSuccessJsonDecode() {
    let url = URL(fileURLWithPath: "")
    let session = NetworkSessionMock()
    
    let bundle = Bundle(for: type(of:self))

    guard let file = bundle.path(forResource: "photos", ofType: "json") else {
      fatalError("File not found")
    }
    
    do {
      session.data = try Data(contentsOf: URL(fileURLWithPath: file))
    } catch {
      fatalError()
    }
      
    session.response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)
  
    let manager = NetworkManager(session: session)
    
    manager.get(from:url,type:[DecodableMock].self) {
      if case .success(let json) = $0 {

        XCTAssertTrue(json?.count == 4,"Error")
        XCTAssertTrue(json?[0].name == "Photo 1","Error")
      } else {
        XCTAssertTrue(false, "Error")
      }
    }
  }
  
    
}
