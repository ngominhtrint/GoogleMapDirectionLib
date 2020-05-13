//
//  DirectionDestinationRequest.swift
//  GoogleMapDirectionLib
//
//  Created by TriNgo on 5/13/20.
//  Copyright © 2020 RoverDream. All rights reserved.
//

import Foundation
import CoreLocation

public class DirectionDestinationRequest {
  
  private var apiKey: String?
  private var origin: CLLocationCoordinate2D?
  private var waypoints: [CLLocationCoordinate2D] = []
  
  init(apiKey: String, origin: CLLocationCoordinate2D) {
    self.apiKey = apiKey
    self.origin = origin
  }
  
  public func and(waypoint: CLLocationCoordinate2D) -> DirectionDestinationRequest {
    self.waypoints.append(waypoint)
    return self
  }
  
  public func and(waypoints: [CLLocationCoordinate2D]) -> DirectionDestinationRequest {
    self.waypoints.append(contentsOf: waypoints)
    return self
  }
  
  public func to(destination: CLLocationCoordinate2D) -> DirectionRequest {
    return DirectionRequest(apiKey: apiKey ?? "",
                            origin: origin ?? CLLocationCoordinate2D(),
                            destination: destination,
                            waypoints: waypoints)
  }
}
