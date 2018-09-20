//
//  Directions.swift
//  App
//
//  Created by Andrea on 20/09/2018.
//

import Vapor
import Foundation

struct Directions: Content {
    var start_address: String
    var end_address: String
    var steps: [DirectionsResponse.RoutesElement.LegsElement]
}

