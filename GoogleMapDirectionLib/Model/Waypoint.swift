//
//  Waypoint.swift
//  GoogleMapDirectionLib
//
//  Created by TriNgo on 5/12/20.
//  Copyright © 2020 RoverDream. All rights reserved.
//

import Foundation
import ObjectMapper

public struct Waypoint: Mappable {
  
  public private(set) var location: Coordination?
  public private(set) var index: Int?
  public private(set) var interpolation: Double?
  
  init() { }
  public init?(map: Map) { }
  
  public mutating func mapping(map: Map) {
    location <- map[WaypointKey.location]
    index <- map[WaypointKey.stepIndex]
    interpolation <- map[WaypointKey.stepInterpolation]
  }
}

fileprivate struct WaypointKey {
  
  static let location = "location"
  static let stepIndex = "step_index"
  static let stepInterpolation = "step_interpolation"
}
