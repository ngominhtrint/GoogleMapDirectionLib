//
//  RequestResult.swift
//  GoogleMapDirectionLib
//
//  Created by TriNgo on 5/12/20.
//  Copyright © 2020 RoverDream. All rights reserved.
//

import Foundation

public struct RequestResult {
  
  public static let OK = "OK"
  public static let NOT_FOUND = "NOT_FOUND"
  public static let ZERO_RESULTS = "ZERO_RESULTS"
  public static let MAX_WAYPOINTS_EXCEEDED = "MAX_WAYPOINTS_EXCEEDED"
  public static let MAX_ROUTE_LENGTH_EXCEEDED = "MAX_ROUTE_LENGTH_EXCEEDED"
  public static let INVALID_REQUEST = "INVALID_REQUEST"
  public static let OVER_DAILY_LIMIT = "OVER_QUERY_LIMIT"
  public static let OVER_QUERY_LIMIT = "OVER_QUERY_LIMIT"
  public static let REQUEST_DENIED = "REQUEST_DENIED"
  public static let UNKNOWN_ERROR = "UNKNOWN_ERROR"
}
