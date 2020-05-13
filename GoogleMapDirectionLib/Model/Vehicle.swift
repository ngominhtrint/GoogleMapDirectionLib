//
//  Vehicle.swift
//  GoogleMapDirectionLib
//
//  Created by TriNgo on 5/12/20.
//  Copyright © 2020 RoverDream. All rights reserved.
//

import Foundation
import ObjectMapper

public struct Vehicle: Mappable {
  
  public private(set) var iconUrl: String?
  public private(set) var name: String?
  public private(set) var type: String?
  
  init() { }
  public init?(map: Map) { }
  
  public mutating func mapping(map: Map) {
    iconUrl <- map[VehicleKey.icon]
    name <- map[VehicleKey.name]
    type <- map[VehicleKey.type]
  }
}

fileprivate struct VehicleKey {
  static let icon = "icon"
  static let name = "name"
  static let type = "type"
}
