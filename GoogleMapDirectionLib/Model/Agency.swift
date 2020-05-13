//
//  Agency.swift
//  GoogleMapDirectionLib
//
//  Created by TriNgo on 5/12/20.
//  Copyright © 2020 RoverDream. All rights reserved.
//

import Foundation
import ObjectMapper

public struct Agency: Mappable {
  
  public private(set) var name: String?
  public private(set) var url: String?
  
  public init?(map: Map) { }
  init() { }
  
  public mutating func mapping(map: Map) {
    name <- map[AgencyKey.name]
    url <- map[AgencyKey.url]
  }
}

fileprivate struct AgencyKey {
  static let name = "name"
  static let url = "url"
}
