//
//  TransitDetail.swift
//  GoogleMapDirectionLib
//
//  Created by TriNgo on 5/13/20.
//  Copyright © 2020 RoverDream. All rights reserved.
//

import Foundation
import ObjectMapper

public struct TransitDetail: Mappable {
  
  public private(set) var arrivalStopPoint: StopPoint?
  public private(set) var arrivalTime: TimeInfo?
  public private(set) var departureStopPoint: StopPoint?
  public private(set) var departureTime: TimeInfo?
  public private(set) var line: Line?
  public private(set) var headsign: String?
  public private(set) var stopNumber: String?
  
  init() { }
  public init?(map: Map) { }
  
  public mutating func mapping(map: Map) {
    arrivalStopPoint <- map[TransitDetailKey.arrivalStop]
    arrivalTime <- map[TransitDetailKey.arrivalTime]
    departureStopPoint <- map[TransitDetailKey.departureStop]
    departureTime <- map[TransitDetailKey.departureTime]
    line <- map[TransitDetailKey.line]
    headsign <- map[TransitDetailKey.headsign]
    stopNumber <- map[TransitDetailKey.numStops]
  }
}

fileprivate struct TransitDetailKey {
  static let arrivalStop = "arrival_stop"
  static let arrivalTime = "arrival_time"
  static let departureStop = "departure_stop"
  static let departureTime = "departure_time"
  static let line = "line"
  static let headsign = "headsign"
  static let numStops = "num_stops"
}
