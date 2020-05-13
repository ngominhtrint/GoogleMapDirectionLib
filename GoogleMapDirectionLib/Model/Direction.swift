//
//  Direction.swift
//  GoogleMapDirectionLib
//
//  Created by TriNgo on 5/13/20.
//  Copyright © 2020 RoverDream. All rights reserved.
//

import Foundation
import ObjectMapper

public struct Direction: Mappable {

  public private(set) var geocodeWaypoints: [GeocodeWaypoint] = []
  public private(set) var routes: [Route] = []
  public private(set) var status: String?
  public private(set) var errorMessage: String?
  
  init() { }
  public init?(map: Map) { }
  
  public mutating func mapping(map: Map) {
    geocodeWaypoints <- map[DirectionKey.geocodedWaypoints]
    routes <- map[DirectionKey.routes]
    status <- map[DirectionKey.status]
    errorMessage <- map[DirectionKey.errorMessage]
  }
  
  public func isOK() -> Bool {
    return RequestResult.OK == (status ?? "")
  }
}

fileprivate struct DirectionKey {
  static let geocodedWaypoints = "geocoded_waypoints"
  static let routes = "routes"
  static let status = "status"
  static let errorMessage = "error_message"
}


