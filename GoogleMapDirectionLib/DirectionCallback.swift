//
//  DirectionCallback.swift
//  GoogleMapDirectionLib
//
//  Created by TriNgo on 5/13/20.
//  Copyright © 2020 RoverDream. All rights reserved.
//

import Foundation

public protocol DirectionCallback {
  
  func onDirectionSuccess(direction: Direction)
  
  func onDirectionFailure(error: Error)
}
