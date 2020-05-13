//
//  DirectionRequestParam.swift
//  GoogleMapDirectionLib
//
//  Created by TriNgo on 5/13/20.
//  Copyright © 2020 RoverDream. All rights reserved.
//

import Foundation
import CoreLocation

public class DirectionRequestParam {
  
  private(set) var origin: CLLocationCoordinate2D?
  private(set) var destination: CLLocationCoordinate2D?
  public var transportMode: String?
  private(set) var departureTime: String?
  public var language: String?
  public var unit: String?
  public var avoid: String?
  public var transitMode: String?
  public var alternatives: Bool = false
  private(set) var apiKey: String?
  private(set) var waypoints: [CLLocationCoordinate2D] = []
  private(set) var optimizeWaypoints: Bool = false
  
  init() { }
  
  public func setOrigin(origin: CLLocationCoordinate2D) -> DirectionRequestParam {
    self.origin = origin
    return self
  }
  
  public func setDestination(destination: CLLocationCoordinate2D) -> DirectionRequestParam {
    self.destination = destination
    return self
  }
  
  public func setApiKey(apiKey: String) -> DirectionRequestParam {
    self.apiKey = apiKey
    return self
  }
  
  public func setDepartureTime(departureTime: String) -> DirectionRequestParam {
    self.departureTime = departureTime
    return self
  }
  
  public func setWaypoints(waypoints: [CLLocationCoordinate2D]) -> DirectionRequestParam {
    self.waypoints = waypoints
    return self
  }
  
  public func setOptimizeWaypoints(optimizeWaypoints: Bool) -> DirectionRequestParam {
    self.optimizeWaypoints = optimizeWaypoints
    return self
  }
}
