//
//  SuggestionsController.swift
//  App
//
//  Created by Andrea on 20/09/2018.
//

import Vapor

/// Controls basic CRUD operations on `Todo`s.
final class SuggestionsController {

    static let apiKey = "AIzaSyCDLXi_SdKlRfW09CzVVT7dbNLHUj2IgsA"
    
    func list(_ req: Request) throws -> Future<Suggestions> {
        
        guard let query = req.query[String.self, at: "text"], query.count >= 3 else {
            throw Abort(.badRequest)
        }
        
        let promise = req.eventLoop.newPromise(Suggestions.self)
        
        let googleMapsResponse = try req.make(Client.self).get("https://maps.googleapis.com/maps/api/place/autocomplete/json") { get in
            try get.query.encode([
                "key": SuggestionsController.apiKey,
                "inputtype": "textquery",
                "input": query
                ])
        }
        
        return googleMapsResponse.flatMap(to: Suggestions.self) { response in
            
            return try response.content.decode(PredictionsResponse.self).flatMap(to: Suggestions.self) { predictionsResponse in
            
                var places = [Place]()
                for element in predictionsResponse.predictions {
                    if let name = element.description, let placeId = element.placeId {
                        let place = Place(name: name, place_id: placeId)
                        places.append(place)
                    }
                }
                let suggestions = Suggestions(suggestions: places)
                promise.succeed(result: suggestions)
                return promise.futureResult
            }
        }
    }
}
