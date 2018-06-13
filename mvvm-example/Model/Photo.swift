//
//  Photo.swift
//  mvvm-example
//
//  Created by Janusz on 13/06/2018.
//  Copyright © 2018 Janusz. All rights reserved.
//

import Foundation

struct Photo:Decodable {
  var id:String
  var title:String
  var owner:String
  var url:String
  
  enum CodingKeys:String, CodingKey {
    case id, titl, owner, secret, farm, server
  }
  
  init(from decoder:Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    
    id = try values.decode(String.self, forKey: .id)
    title = try values.decode(String.self, forKey: .titl)
    owner = try values.decode(String.self, forKey: .owner)
    
    let farm = try values.decode(Int.self, forKey: .farm)
    let secret = try values.decode(String.self, forKey: .secret)
    let server = try values.decode(String.self, forKey: .server)
    
    url = "https://farm\(farm).staticflickr.com/\(server)/\(id)_\(secret).jpg"
  }
}
