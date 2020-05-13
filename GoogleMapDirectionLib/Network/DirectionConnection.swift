//
//  DirectionConnection.swift
//  GoogleMapDirectionLib
//
//  Created by TriNgo on 5/13/20.
//  Copyright © 2020 RoverDream. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire
import RxAlamofire
import RxSwift

public final class DirectionConnection: DirectionService {
  
  let scheduler = ConcurrentDispatchQueueScheduler(qos: DispatchQoS(qosClass: DispatchQoS.QoSClass.background,
                                                                    relativePriority: 1))
  
  public func getDirection(origin: String, destination: String, waypoints: String,
                           transportMode: String, departureTime: String, language: String,
                           units: String, avoid: String, transitMode: String,
                           alternatives: Bool, apiKey: String) -> Single<Direction> {
  
    let directionMapper = Mapper<Direction>()
    let directionEndPoint = buildUrl(origin: origin, destination: destination, waypoints: waypoints,
                                     transportMode: transportMode, departureTime: departureTime, language: language,
                                     units: units, avoid: avoid, transitMode: transitMode,
                                     alternatives: alternatives, apiKey: apiKey)
    
    return RxAlamofire.request(.get, directionEndPoint, parameters: nil,
                               encoding: JSONEncoding.default, headers: nil)
      .responseJSON()
      .observeOn(scheduler)
      .map { response in
        guard let json = response.result.value as? [String : Any] else { return [:] }
        return json
      }
      .asSingle()
      .map { json -> Direction in
        return directionMapper.map(JSONObject: json) ?? Direction()
    }
  }
}

extension DirectionConnection {
  
  func buildUrl(origin: String, destination: String, waypoints: String,
                transportMode: String, departureTime: String, language: String,
                units: String, avoid: String, transitMode: String,
                alternatives: Bool, apiKey: String) -> String {
    
    var urlComponents = URLComponents(string: DirectionUrl.MAP_API_URL) ?? URLComponents()
    urlComponents.path = DirectionUrl.DIRECTION_API_URL
    urlComponents.queryItems = [
      URLQueryItem(name: "origin", value: origin),
      URLQueryItem(name: "destination", value: destination),
      URLQueryItem(name: "waypoints", value: waypoints),
      URLQueryItem(name: "mode", value: transportMode),
      URLQueryItem(name: "departure_time", value: departureTime),
      URLQueryItem(name: "language", value: language),
      URLQueryItem(name: "units", value: units),
      URLQueryItem(name: "avoid", value: avoid),
      URLQueryItem(name: "transit_mode", value: transitMode),
      URLQueryItem(name: "alternatives", value: String(describing: alternatives)),
      URLQueryItem(name: "key", value: apiKey)
    ]
    
    guard let url = urlComponents.url else { return "" }
    return url.absoluteString
  }
}
