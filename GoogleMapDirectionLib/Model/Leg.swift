//
//  Leg.swift
//  GoogleMapDirectionLib
//
//  Created by TriNgo on 5/13/20.
//  Copyright © 2020 RoverDream. All rights reserved.
//

import Foundation
import ObjectMapper

public struct Leg: Mappable {
  
  public private(set) var arrivalTime: TimeInfo?
  public private(set) var departureTime: TimeInfo?
  public private(set) var distance: Info?
  public private(set) var duration: Info?
  public private(set) var durationInTraffic: Info?
  public private(set) var endAddress: String?
  public private(set) var endLocation: Coordination?
  public private(set) var startAddress: String?
  public private(set) var startLocation: Coordination?
  public private(set) var steps: [Step] = []
  public private(set) var viaWaypoints: [Waypoint] = []
  
  init() { }
  public init?(map: Map) { }
  
  public mutating func mapping(map: Map) {
    arrivalTime <- map[LegKey.arrivalTime]
    departureTime <- map[LegKey.departureTime]
    distance <- map[LegKey.distance]
    duration <- map[LegKey.duration]
    durationInTraffic <- map[LegKey.durationInTraffic]
    endAddress <- map[LegKey.endAddress]
    endLocation <- map[LegKey.endLocation]
    startAddress <- map[LegKey.startAddress]
    startLocation <- map[LegKey.startLocation]
    steps <- map[LegKey.steps]
    viaWaypoints <- map[LegKey.viaWaypoint]
  }
}

fileprivate struct LegKey {
  static let arrivalTime = "arrival_time"
  static let departureTime = "departure_time"
  static let distance = "distance"
  static let duration = "duration"
  static let durationInTraffic = "duration_in_traffic"
  static let endAddress = "end_address"
  static let endLocation = "end_location"
  static let startAddress = "start_address"
  static let startLocation = "start_location"
  static let steps = "steps"
  static let viaWaypoint = "via_waypoint"
}
