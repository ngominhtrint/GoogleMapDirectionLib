//
//  Step.swift
//  GoogleMapDirectionLib
//
//  Created by TriNgo on 5/13/20.
//  Copyright © 2020 RoverDream. All rights reserved.
//

import Foundation
import ObjectMapper

public struct Step: Mappable {
  
  public private(set) var distance: Info?
  public private(set) var duration: Info?
  public private(set) var endLocation: Coordination?
  public private(set) var htmlInstrution: String?
  public private(set) var maneuver: String?
  public private(set) var startLoation: Coordination?
  public private(set) var transitDetail: TransitDetail?
  public private(set) var steps: [Step] = []
  public private(set) var polyline: RoutePolyline?
  public private(set) var travelMode: String?
  
  init() { }
  public init?(map: Map) { }
  
  public mutating func mapping(map: Map) {
    distance <- map[StepKey.distance]
    duration <- map[StepKey.duration]
    endLocation <- map[StepKey.endLocation]
    htmlInstrution <- map[StepKey.htmlInstructions]
    maneuver <- map[StepKey.maneuver]
    startLoation <- map[StepKey.startLocation]
    transitDetail <- map[StepKey.transitDetails]
    steps <- map[StepKey.steps]
    polyline <- map[StepKey.polyline]
    travelMode <- map[StepKey.travelMode]
  }
}

fileprivate struct StepKey {
  static let distance = "distance"
  static let duration = "duration"
  static let endLocation = "end_location"
  static let htmlInstructions = "html_instructions"
  static let maneuver = "maneuver"
  static let startLocation = "start_location"
  static let transitDetails = "transit_details"
  static let steps = "steps"
  static let polyline = "polyline"
  static let travelMode = "travel_mode"
}
