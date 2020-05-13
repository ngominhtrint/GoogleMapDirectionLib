//
//  GoogleDirection.swift
//  GoogleMapDirectionLib
//
//  Created by TriNgo on 5/13/20.
//  Copyright © 2020 RoverDream. All rights reserved.
//

import Foundation

public struct GoogleDirection {
  
  public static func withServerKey(apiKey: String) -> DirectionOriginRequest {
    return DirectionOriginRequest(apiKey: apiKey)
  }
}
