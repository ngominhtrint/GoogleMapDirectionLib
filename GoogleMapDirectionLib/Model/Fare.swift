//
//  Fare.swift
//  GoogleMapDirectionLib
//
//  Created by TriNgo on 5/12/20.
//  Copyright © 2020 RoverDream. All rights reserved.
//

import Foundation
import ObjectMapper

public struct Fare: Mappable {
  
  public private(set) var currency: String?
  public private(set) var value: String?
  public private(set) var text: String?
  
  init() { }
  public init?(map: Map) { }
  
  public mutating func mapping(map: Map) {
    currency <- map[FareKey.currency]
    value <- map[FareKey.value]
    text <- map[FareKey.text]
  }
}

fileprivate struct FareKey {
  static let currency = "currency"
  static let value = "value"
  static let text = "text"
}
