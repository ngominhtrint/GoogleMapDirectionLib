//
//  DirectionService.swift
//  GoogleMapDirectionLib
//
//  Created by TriNgo on 5/13/20.
//  Copyright © 2020 RoverDream. All rights reserved.
//

import Foundation
import RxSwift

public protocol DirectionService {
  
  func getDirection(
    origin: String,
    destination: String,
    waypoints: String,
    transportMode: String,
    departureTime: String,
    language: String,
    units: String,
    avoid: String,
    transitMode: String,
    alternatives: Bool,
    apiKey: String
  ) -> Single<Direction>
}
