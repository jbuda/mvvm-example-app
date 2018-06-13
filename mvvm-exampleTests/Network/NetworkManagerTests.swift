//
//  NetworkManagerTests.swift
//  mvvm-exampleTests
//
//  Created by Janusz on 01/06/2018.
//  Copyright © 2018 Janusz. All rights reserved.
//

import XCTest

@testable import mvvm_example

struct ModelMock:Decodable {
  var name:String
}

class NetworkManagerTests: XCTestCase {
  
  func testFailedStatusCodeResponse() {
    let url = URL(fileURLWithPath: "")
    
    let session = NetworkSessionMock()
    session.response = HTTPURLResponse(url: url, statusCode: 401, httpVersion: nil, headerFields: nil)
   
    let manager = NetworkManager(session:session)
    
    manager.get(from: url, type: ModelMock.self) {
      if case .failure = $0 { }
      else {
        XCTAssertTrue(false,"Error")
      }
    }
  }
  
  func testFailedNoResponse() {
    let url = URL(fileURLWithPath: "")

    let session = NetworkSessionMock()
    let manager = NetworkManager(session:session)
    
    manager.get(from: url, type: ModelMock.self) {
      if case .failure = $0 { }
      else {
        XCTAssertTrue(false,"Error")
      }
    }
  }
  
  func testSuccessPhotosDecode() {
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
    
    manager.get(from:url,type:Photos.self) {
      if case .success(let json) = $0 {

        XCTAssertTrue(json?.page == 1)
        XCTAssertTrue(json?.pages == 4985)
        XCTAssertTrue(json?.photo.count == 3)
        
        XCTAssertTrue(json?.photo[0].owner == "52448841@N04")
        XCTAssertTrue(json?.photo[1].owner == "140884837@N07")
        XCTAssertTrue(json?.photo[2].owner == "12446498@N06")
        
        XCTAssertTrue(json?.photo[0].url == "https://farm1.staticflickr.com/895/42775359771_30e2ace84b.jpg")
        XCTAssertTrue(json?.photo[1].url == "https://farm2.staticflickr.com/1731/40964127630_2a07044300.jpg")
        XCTAssertTrue(json?.photo[2].url == "https://farm1.staticflickr.com/899/40964124770_5f45f80b67.jpg")
      } else {
        XCTAssertTrue(false, "Error")
      }
    }
  }
}
