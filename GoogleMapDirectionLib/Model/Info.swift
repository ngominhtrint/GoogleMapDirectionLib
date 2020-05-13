//
//  Info.swift
//  GoogleMapDirectionLib
//
//  Created by TriNgo on 5/12/20.
//  Copyright © 2020 RoverDream. All rights reserved.
//

import Foundation
import ObjectMapper

public struct Info: Mappable {
  
  public private(set) var text: String?
  public private(set) var value: Double = 0.0
  
  init() { }
  public init?(map: Map) { }
  
  public mutating func mapping(map: Map) {
    text <- map[InfoKey.text]
    value <- map[InfoKey.value]
  }
}

fileprivate struct InfoKey {
  static let text = "text"
  static let value = "value"
}
