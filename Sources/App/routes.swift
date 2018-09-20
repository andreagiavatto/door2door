import Vapor

public func routes(_ router: Router) throws {

    let suggestionsController = SuggestionsController()
    router.get("suggestions", use: suggestionsController.list)
    
    let directionsController = DirectionsController()
    router.get("directions", use: directionsController.list)
}
