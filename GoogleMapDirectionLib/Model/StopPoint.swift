//
//  StopPoint.swift
//  GoogleMapDirectionLib
//
//  Created by TriNgo on 5/12/20.
//  Copyright © 2020 RoverDream. All rights reserved.
//

import Foundation
import ObjectMapper

public struct StopPoint: Mappable {
  
  public private(set) var location: Coordination?
  public private(set) var name: String?
  
  init() { }
  public init?(map: Map) { }
  
  public mutating func mapping(map: Map) {
    location <- map[StopPointKey.location]
    name <- map[StopPointKey.name]
  }
}

fileprivate struct StopPointKey {
  static let location = "location"
  static let name = "name"
}
