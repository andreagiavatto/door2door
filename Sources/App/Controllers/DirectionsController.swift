//
//  DirectionsController.swift
//  App
//
//  Created by Andrea on 20/09/2018.
//

import Vapor

/// Controls basic CRUD operations on `Todo`s.
final class DirectionsController {
    
    static let apiKey = "AIzaSyCDLXi_SdKlRfW09CzVVT7dbNLHUj2IgsA"
    
    func list(_ req: Request) throws -> Future<Directions> {
        
        guard
            let origin = req.query[String.self, at: "origin"], origin.count >= 3,
            let destination = req.query[String.self, at: "destination"], destination.count >= 3
        else {
            throw Abort(.badRequest)
        }
        
        let promise = req.eventLoop.newPromise(Directions.self)
        
        let googleMapsResponse = try req.make(Client.self).get("https://maps.googleapis.com/maps/api/directions/json") { get in
            try get.query.encode([
                "key": DirectionsController.apiKey,
                "origin": "place_id:\(origin)",
                "destination": "place_id:\(destination)",
                "mode": "transit"
                ])
        }
        
        return googleMapsResponse.flatMap(to: Directions.self) { response in
            
            return try response.content.decode(DirectionsResponse.self).flatMap(to: Directions.self) { directionsResponse in
                
                print(directionsResponse)
                var start_address = ""
                var end_address = ""
                var steps = [DirectionsResponse.RoutesElement.LegsElement]()
                if let legs = directionsResponse.routes.first?.legs {
                    steps.append(contentsOf: legs)
                    start_address = legs.first?.startAddress ?? ""
                    end_address = legs.first?.endAddress ?? ""
                }
                let directions = Directions(start_address: start_address, end_address: end_address, steps: steps)
                promise.succeed(result: directions)
                return promise.futureResult
            }
        }
    }
}
