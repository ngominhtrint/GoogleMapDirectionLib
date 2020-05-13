//
//  RoutePolyline.swift
//  GoogleMapDirectionLib
//
//  Created by TriNgo on 5/13/20.
//  Copyright © 2020 RoverDream. All rights reserved.
//

import Foundation
import ObjectMapper

public struct RoutePolyline: Mappable {
  
  public private(set) var rawPoints: String?
  
  init() { }
  public init?(map: Map) { }
  
  public mutating func mapping(map: Map) {
    rawPoints <- map[RoutePolylineKey.points]
  }
}

fileprivate struct RoutePolylineKey {
  static let points = "points"
}
