//
//  Route.swift
//  GoogleMapDirectionLib
//
//  Created by TriNgo on 5/13/20.
//  Copyright © 2020 RoverDream. All rights reserved.
//

import Foundation
import ObjectMapper

public struct Route: Mappable {
  
  public private(set) var bound: Bound?
  public private(set) var copyrights: String?
  public private(set) var legs: [Leg] = []
  public private(set) var overviewPolyline: RoutePolyline?
  public private(set) var summary: String?
  public private(set) var fare: Fare?
  public private(set) var warnings: [String] = []
  public private(set) var waypointOrders: [Double] = []
  
  init() { }
  public init?(map: Map) { }
  
  public mutating func mapping(map: Map) {
    bound <- map[RouteKey.bounds]
    copyrights <- map[RouteKey.copyrights]
    legs <- map[RouteKey.legs]
    overviewPolyline <- map[RouteKey.overviewPolyline]
    summary <- map[RouteKey.summary]
    fare <- map[RouteKey.fare]
    warnings <- map[RouteKey.warnings]
    waypointOrders <- map[RouteKey.waypoint_order]
  }
}

fileprivate struct RouteKey {
  static let bounds = "bounds"
  static let copyrights = "copyrights"
  static let legs = "legs"
  static let overviewPolyline = "overview_polyline"
  static let summary = "summary"
  static let fare = "fare"
  static let warnings = "warnings"
  static let waypoint_order = "waypoint_order"
}
