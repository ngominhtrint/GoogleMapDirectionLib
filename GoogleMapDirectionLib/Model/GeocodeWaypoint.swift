//
//  GeocodeWaypoint.swift
//  GoogleMapDirectionLib
//
//  Created by TriNgo on 5/12/20.
//  Copyright © 2020 RoverDream. All rights reserved.
//

import Foundation
import ObjectMapper

public struct GeocodeWaypoint: Mappable {
  
  public private(set) var status: String?
  public private(set) var placeId: String?
  public private(set) var types: [String] = []
  
  init() { }
  public init?(map: Map) { }
  
  public mutating func mapping(map: Map) {
    status <- map[GeocodeWaypointKey.status]
    placeId <- map[GeocodeWaypointKey.placeId]
    types <- map[GeocodeWaypointKey.types]
  }
}

fileprivate struct GeocodeWaypointKey {
  static let status = "geocoder_status"
  static let placeId = "place_id"
  static let types = "types"
}
