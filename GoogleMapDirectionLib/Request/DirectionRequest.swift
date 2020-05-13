//
//  DirectionRequest.swift
//  GoogleMapDirectionLib
//
//  Created by TriNgo on 5/13/20.
//  Copyright © 2020 RoverDream. All rights reserved.
//

import Foundation
import CoreLocation
import RxAlamofire
import RxSwift

public struct DirectionRequest {
  
  private let disposeBag = DisposeBag()
  private var param: DirectionRequestParam?
  
  init(apiKey: String,
       origin: CLLocationCoordinate2D,
       destination: CLLocationCoordinate2D,
       waypoints: [CLLocationCoordinate2D]) {
    param = DirectionRequestParam()
      .setApiKey(apiKey: apiKey)
      .setOrigin(origin: origin)
      .setDestination(destination: destination)
      .setWaypoints(waypoints: waypoints)
  }
  
  public func transportMode(transportMode: String) -> DirectionRequest {
    param?.transportMode = transportMode
    return self
  }
  
  public func language(language: String) -> DirectionRequest {
    param?.language = language
    return self
  }
  
  public func unit(unit: String) -> DirectionRequest {
    param?.unit = unit
    return self
  }
  
  public func avoid(avoid: String) -> DirectionRequest {
    var oldAvoid = param?.avoid ?? ""
    if !oldAvoid.isEmpty {
      oldAvoid.append("|")
    } else {
      oldAvoid = ""
    }
    oldAvoid.append(avoid)
    param?.avoid = oldAvoid
    return self
  }
  
  public func transitMode(transitMode: String) -> DirectionRequest {
    var oldTransitMode = param?.transitMode ?? ""
    if !oldTransitMode.isEmpty {
      oldTransitMode.append("|")
    } else {
      oldTransitMode = ""
    }
    oldTransitMode.append(transitMode)
    param?.transitMode = oldTransitMode
    return self
  }
  
  public func alternativeRoute(alternative: Bool) -> DirectionRequest {
    param?.alternatives = alternative
    return self
  }
  
  public func departureTime(time: String) -> DirectionRequest {
    _ = param?.setDepartureTime(departureTime: time)
    return self
  }
  
  public func optimizeWaypoints(optimize: Bool) -> DirectionRequest {
    _ = param?.setOptimizeWaypoints(optimizeWaypoints: optimize)
    return self
  }
  
  public func execute(callback: DirectionCallback) {
    _ = DirectionConnection().getDirection(
      origin: "\(param?.origin?.latitude ?? 0.0),\(param?.origin?.longitude ?? 0.0)",
      destination: "\(param?.destination?.latitude ?? 0.0),\(param?.destination?.longitude ?? 0.0)",
      waypoints: waypointsToString(waypoints: param?.waypoints ?? []),
      transportMode: param?.transportMode ?? "",
      departureTime: param?.departureTime ?? "",
      language: param?.language ?? "",
      units: param?.unit ?? "",
      avoid: param?.avoid ?? "",
      transitMode: param?.transitMode ?? "",
      alternatives: param?.alternatives ?? false,
      apiKey: param?.apiKey ?? "")
      .observeOn(MainScheduler.instance)
      .subscribe(onSuccess: { direction in
        callback.onDirectionSuccess(direction: direction)
      }) { (error) in
        callback.onDirectionFailure(error: error)
      }
  }
  
  private func waypointsToString(waypoints: [CLLocationCoordinate2D]) -> String {
    if (!waypoints.isEmpty) {
      var text = param?.optimizeWaypoints ?? false ? "optimize:true|" : ""
      text.append(String(describing: waypoints[0].latitude))
      text.append(",")
      text.append(String(describing: waypoints[0].longitude))
      for i in 1..<waypoints.count {
        text.append("|")
        text.append(String(describing: waypoints[i].latitude))
        text.append(",")
        text.append(String(describing: waypoints[i].longitude))
      }
      return text
    }
    return ""
  }
}
