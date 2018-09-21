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
    var departure_time: String
    var end_address: String
    var arrival_time: String
    var total_duration: String
    var steps: [DirectionsResponse.RoutesElement.LegsElement.StepsElement]
}

