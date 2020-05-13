//
//  Line.swift
//  GoogleMapDirectionLib
//
//  Created by TriNgo on 5/12/20.
//  Copyright © 2020 RoverDream. All rights reserved.
//

import Foundation
import ObjectMapper

public struct Line: Mappable {
  
  public private(set) var agencies: [Agency] = []
  public private(set) var color: String?
  public private(set) var name: String?
  public private(set) var shortName: String?
  public private(set) var textColor: String?
  public private(set) var vehicle: Vehicle?
  
  init() { }
  public init?(map: Map) { }
  
  public mutating func mapping(map: Map) {
    agencies <- map[LineKey.agencies]
    color <- map[LineKey.color]
    name <- map[LineKey.name]
    shortName <- map[LineKey.shortName]
    textColor <- map[LineKey.textColor]
    vehicle <- map[LineKey.vehicle]
  }
}

fileprivate struct LineKey {
  static let agencies = "agencies"
  static let color = "color"
  static let name = "name"
  static let shortName = "short_name"
  static let textColor = "text_color"
  static let vehicle = "vehicle"
}
