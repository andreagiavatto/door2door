//
//  Suggestion.swift
//  App
//
//  Created by Andrea on 20/09/2018.
//

import Vapor
import Foundation

struct Suggestions: Content {
    var suggestions: [Suggestion]
}

struct Suggestion: Content {
    var name: String
    var place_id: String
}
