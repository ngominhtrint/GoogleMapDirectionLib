//
//  TimeInfo.swift
//  GoogleMapDirectionLib
//
//  Created by TriNgo on 5/12/20.
//  Copyright © 2020 RoverDream. All rights reserved.
//

import Foundation
import ObjectMapper

public struct TimeInfo: Mappable {
  
  public private(set) var text: String?
  public private(set) var timeZone: String?
  public private(set) var value: String?
  
  init() { }
  public init?(map: Map) { }
  
  public mutating func mapping(map: Map) {
    text <- map[TimeInfoKey.text]
    timeZone <- map[TimeInfoKey.timeZone]
    value <- map[TimeInfoKey.value]
  }
}

fileprivate struct TimeInfoKey {
  static let text = "text"
  static let timeZone = "time_zone"
  static let value = "value"
}
