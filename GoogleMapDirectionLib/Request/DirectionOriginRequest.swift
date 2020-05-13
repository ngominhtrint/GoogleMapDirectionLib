//
//  DirectionOriginRequest.swift
//  GoogleMapDirectionLib
//
//  Created by TriNgo on 5/13/20.
//  Copyright © 2020 RoverDream. All rights reserved.
//

import Foundation
import CoreLocation

public class DirectionOriginRequest {
  
  private var apiKey: String?
  
  init(apiKey: String) {
    self.apiKey = apiKey
  }
  
  public func from(origin: CLLocationCoordinate2D) -> DirectionDestinationRequest {
    return DirectionDestinationRequest(apiKey: apiKey ?? "", origin: origin)
  }
}
