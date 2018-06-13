//
//  Photos.swift
//  mvvm-example
//
//  Created by Janusz on 13/06/2018.
//  Copyright © 2018 Janusz. All rights reserved.
//

import Foundation

struct Photos:Decodable {
  var page:Int
  var pages:Int
  var photo:[Photo]
  
  enum CodingKeys:String, CodingKey {
    case photos
  }
  
  enum PhotosKeys:String, CodingKey {
    case page, pages, photo
  }
  
  init(from decoder:Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    
    let photos = try values.nestedContainer(keyedBy: PhotosKeys.self, forKey: .photos)
    
    page = try photos.decode(Int.self, forKey: .page)
    pages = try photos.decode(Int.self, forKey: .pages)
    
    photo = try photos.decode([Photo].self, forKey: .photo)
  }
}
