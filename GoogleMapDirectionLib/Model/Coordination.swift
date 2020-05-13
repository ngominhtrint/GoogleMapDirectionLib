//
//  Coordinator.swift
//  GoogleMapDirectionLib
//
//  Created by TriNgo on 5/12/20.
//  Copyright © 2020 RoverDream. All rights reserved.
//

import Foundation
import ObjectMapper

public struct Coordination: Mappable {
  
  public private(set) var latitude: Double = 0.0
  public private(set) var longitude: Double = 0.0
  
  init() { }
  public init?(map: Map) { }
  
  public mutating func mapping(map: Map) {
    latitude <- map[CoordinationKey.lat]
    longitude <- map[CoordinationKey.lng]
  }
}

fileprivate struct CoordinationKey {
  static let lat = "lat"
  static let lng = "lng"
}
