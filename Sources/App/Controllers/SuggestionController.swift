//
//  SuggestionController.swift
//  App
//
//  Created by Andrea on 20/09/2018.
//

import Vapor

/// Controls basic CRUD operations on `Todo`s.
final class SuggestionController {

    func list(_ req: Request) throws -> Future<Suggestions> {
        guard let query = req.query[String.self, at: "text"], query.count >= 3 else {
            throw Abort(.badRequest)
        }
        let promise = req.eventLoop.newPromise(Suggestions.self)
        
        
        let googleMapsResponse = try req.make(Client.self).get("https://maps.googleapis.com/maps/api/place/autocomplete/json") { get in
            try get.query.encode([
                "key": "AIzaSyCDLXi_SdKlRfW09CzVVT7dbNLHUj2IgsA",
                "inputtype": "textquery",
                "input": query
                ])
        }
        
        return googleMapsResponse.flatMap(to: Suggestions.self) { response in
            
//            print(response)
            return try response.content.decode(PredictionsResponse.self).flatMap(to: Suggestions.self) { predictionsResponse in
            
                var sugg = [Suggestion]()
                for element in predictionsResponse.predictions {
                    if let name = element.description, let placeId = element.placeId {
                        let s1 = Suggestion(name: name, place_id: placeId)
                        sugg.append(s1)
                    }
                }
                let s = Suggestions(suggestions: sugg)
                promise.succeed(result: s)
                return promise.futureResult
            }
        }
    }
}
