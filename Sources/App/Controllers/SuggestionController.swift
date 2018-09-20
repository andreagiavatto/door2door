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
        let promise = req.eventLoop.newPromise(Suggestions.self)
        let s1 = Suggestion(name: "Chancery Lane", place_id: "42")
        let s2 = Suggestion(name: "WeWork", place_id: "123")
        let suggestions = Suggestions(suggestions: [s1, s2])
        promise.succeed(result: suggestions)
        return promise.futureResult
        /// Fails the associated future
//        promiseString.fail(error: ...)
    }
    //
    //    /// Saves a decoded `Todo` to the database.
    //    func create(_ req: Request) throws -> Future<Todo> {
    //        return try req.content.decode(Todo.self).flatMap { todo in
    //            return todo.save(on: req)
    //        }
    //    }
    //
    //    /// Deletes a parameterized `Todo`.
    //    func delete(_ req: Request) throws -> Future<HTTPStatus> {
    //        return try req.parameters.next(Todo.self).flatMap { todo in
    //            return todo.delete(on: req)
    //        }.transform(to: .ok)
    //    }
}
