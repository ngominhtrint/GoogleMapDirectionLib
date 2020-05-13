//
//  Bound.swift
//  GoogleMapDirectionLib
//
//  Created by TriNgo on 5/12/20.
//  Copyright © 2020 RoverDream. All rights reserved.
//

import Foundation
import ObjectMapper

public struct Bound: Mappable {
  
  public private(set) var northeast: Coordination?
  public private(set) var southwest: Coordination?
  
  init() { }
  public init?(map: Map) { }
  
  public mutating func mapping(map: Map) {
    northeast <- map[BoundKey.northeast]
    southwest <- map[BoundKey.southwest]
  }
}

fileprivate struct BoundKey {
  static let northeast = "northeast"
  static let southwest = "southwest"
}
