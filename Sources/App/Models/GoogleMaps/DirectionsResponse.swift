//
//  Copyright © 2018 Company. All rights reserved.
//

import Foundation

public struct DirectionsResponse {

    public struct GeocodedWaypointsElement {
        public let geocoderStatus: String?
        public let placeId: String?
        public let types: [String]
    }

    public struct RoutesElement {

        public struct Bounds {

            public struct Northeast {
                public let lat: Double?
                public let lng: Double?
            }

            public struct Southwest {
                public let lat: Double?
                public let lng: Double?
            }

            public let northeast: Northeast?
            public let southwest: Southwest?
        }

        public struct LegsElement {

            public struct ArrivalTime {
                public let text: String?
                public let timeZone: String?
                public let value: Int?
            }

            public struct DepartureTime {
                public let text: String?
                public let timeZone: String?
                public let value: Int?
            }

            public struct Distance {
                public let text: String?
                public let value: Int?
            }

            public struct Duration {
                public let text: String?
                public let value: Int?
            }

            public struct EndLocation {
                public let lat: Double?
                public let lng: Double?
            }

            public struct StartLocation {
                public let lat: Double?
                public let lng: Double?
            }

            public struct StepsElement {

                public struct Distance {
                    public let text: String?
                    public let value: Int?
                }

                public struct Duration {
                    public let text: String?
                    public let value: Int?
                }

                public struct EndLocation {
                    public let lat: Double?
                    public let lng: Double?
                }

                public struct StartLocation {
                    public let lat: Double?
                    public let lng: Double?
                }

                public struct TransitDetails {

                    public struct ArrivalStop {

                        public struct Location {
                            public let lat: Double?
                            public let lng: Double?
                        }

                        public let location: Location?
                        public let name: String?
                    }

                    public struct ArrivalTime {
                        public let text: String?
                        public let timeZone: String?
                        public let value: Int?
                    }

                    public struct DepartureStop {

                        public struct Location {
                            public let lat: Double?
                            public let lng: Double?
                        }

                        public let location: Location?
                        public let name: String?
                    }

                    public struct DepartureTime {
                        public let text: String?
                        public let timeZone: String?
                        public let value: Int?
                    }

                    public struct Line {

                        public struct AgenciesElement {
                            public let name: String?
                            public let url: String?
                        }

                        public struct Vehicle {
                            public let icon: String?
                            public let localIcon: String?
                            public let name: String?
                            public let type: String?
                        }

                        public let agencies: [AgenciesElement]
                        public let color: String?
                        public let name: String?
                        public let textColor: String?
                        public let vehicle: Vehicle?
                    }

                    public let arrivalStop: ArrivalStop?
                    public let arrivalTime: ArrivalTime?
                    public let departureStop: DepartureStop?
                    public let departureTime: DepartureTime?
                    public let headsign: String?
                    public let line: Line?
                    public let numStops: Int?
                }

                public let distance: Distance?
                public let duration: Duration?
                public let endLocation: EndLocation?
                public let htmlInstructions: String?
                public let startLocation: StartLocation?
                public let transitDetails: TransitDetails?
                public let travelMode: String?
            }

            public let arrivalTime: ArrivalTime?
            public let departureTime: DepartureTime?
            public let distance: Distance?
            public let duration: Duration?
            public let endAddress: String?
            public let endLocation: EndLocation?
            public let startAddress: String?
            public let startLocation: StartLocation?
            public let steps: [StepsElement]
        }

        public let bounds: Bounds?
        public let copyrights: String?
        public let legs: [LegsElement]
    }

    public let geocodedWaypoints: [GeocodedWaypointsElement]
    public let routes: [RoutesElement]
    public let status: String?
}

// ---------------------------------------------------------------------------
// MARK: - Codable
// ---------------------------------------------------------------------------
        
extension DirectionsResponse: Codable {
        
    enum CodingKeys: String, CodingKey {
        case geocodedWaypoints = "geocoded_waypoints"
        case routes
        case status
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        geocodedWaypoints = try container.decodeIfPresent([GeocodedWaypointsElement].self, forKey: .geocodedWaypoints) ?? []
        routes = try container.decodeIfPresent([RoutesElement].self, forKey: .routes) ?? []
        status = try container.decodeIfPresent(String.self, forKey: .status)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(geocodedWaypoints, forKey: .geocodedWaypoints)
        try container.encode(routes, forKey: .routes)
        try container.encodeIfPresent(status, forKey: .status)
    }
}
        
extension DirectionsResponse.GeocodedWaypointsElement: Codable {
        
    enum CodingKeys: String, CodingKey {
        case geocoderStatus = "geocoder_status"
        case placeId = "place_id"
        case types
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        geocoderStatus = try container.decodeIfPresent(String.self, forKey: .geocoderStatus)
        placeId = try container.decodeIfPresent(String.self, forKey: .placeId)
        types = try container.decodeIfPresent([String].self, forKey: .types) ?? []
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(geocoderStatus, forKey: .geocoderStatus)
        try container.encodeIfPresent(placeId, forKey: .placeId)
        try container.encode(types, forKey: .types)
    }
}
        
extension DirectionsResponse.RoutesElement: Codable {
        
    enum CodingKeys: String, CodingKey {
        case bounds
        case copyrights
        case legs
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        bounds = try container.decodeIfPresent(Bounds.self, forKey: .bounds)
        copyrights = try container.decodeIfPresent(String.self, forKey: .copyrights)
        legs = try container.decodeIfPresent([LegsElement].self, forKey: .legs) ?? []
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(bounds, forKey: .bounds)
        try container.encodeIfPresent(copyrights, forKey: .copyrights)
        try container.encode(legs, forKey: .legs)
    }
}
        
extension DirectionsResponse.RoutesElement.Bounds: Codable {
        
    enum CodingKeys: String, CodingKey {
        case northeast
        case southwest
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        northeast = try container.decodeIfPresent(Northeast.self, forKey: .northeast)
        southwest = try container.decodeIfPresent(Southwest.self, forKey: .southwest)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(northeast, forKey: .northeast)
        try container.encodeIfPresent(southwest, forKey: .southwest)
    }
}
        
extension DirectionsResponse.RoutesElement.Bounds.Northeast: Codable {
        
    enum CodingKeys: String, CodingKey {
        case lat
        case lng
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        lat = try container.decodeIfPresent(Double.self, forKey: .lat)
        lng = try container.decodeIfPresent(Double.self, forKey: .lng)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(lat, forKey: .lat)
        try container.encodeIfPresent(lng, forKey: .lng)
    }
}
        
extension DirectionsResponse.RoutesElement.Bounds.Southwest: Codable {
        
    enum CodingKeys: String, CodingKey {
        case lat
        case lng
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        lat = try container.decodeIfPresent(Double.self, forKey: .lat)
        lng = try container.decodeIfPresent(Double.self, forKey: .lng)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(lat, forKey: .lat)
        try container.encodeIfPresent(lng, forKey: .lng)
    }
}
        
extension DirectionsResponse.RoutesElement.LegsElement: Codable {
        
    enum CodingKeys: String, CodingKey {
        case arrivalTime = "arrival_time"
        case departureTime = "departure_time"
        case distance
        case duration
        case endAddress = "end_address"
        case endLocation = "end_location"
        case startAddress = "start_address"
        case startLocation = "start_location"
        case steps
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        arrivalTime = try container.decodeIfPresent(ArrivalTime.self, forKey: .arrivalTime)
        departureTime = try container.decodeIfPresent(DepartureTime.self, forKey: .departureTime)
        distance = try container.decodeIfPresent(Distance.self, forKey: .distance)
        duration = try container.decodeIfPresent(Duration.self, forKey: .duration)
        endAddress = try container.decodeIfPresent(String.self, forKey: .endAddress)
        endLocation = try container.decodeIfPresent(EndLocation.self, forKey: .endLocation)
        startAddress = try container.decodeIfPresent(String.self, forKey: .startAddress)
        startLocation = try container.decodeIfPresent(StartLocation.self, forKey: .startLocation)
        steps = try container.decodeIfPresent([StepsElement].self, forKey: .steps) ?? []
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(arrivalTime, forKey: .arrivalTime)
        try container.encodeIfPresent(departureTime, forKey: .departureTime)
        try container.encodeIfPresent(distance, forKey: .distance)
        try container.encodeIfPresent(duration, forKey: .duration)
        try container.encodeIfPresent(endAddress, forKey: .endAddress)
        try container.encodeIfPresent(endLocation, forKey: .endLocation)
        try container.encodeIfPresent(startAddress, forKey: .startAddress)
        try container.encodeIfPresent(startLocation, forKey: .startLocation)
        try container.encode(steps, forKey: .steps)
    }
}
        
extension DirectionsResponse.RoutesElement.LegsElement.ArrivalTime: Codable {
        
    enum CodingKeys: String, CodingKey {
        case text
        case timeZone = "time_zone"
        case value
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        text = try container.decodeIfPresent(String.self, forKey: .text)
        timeZone = try container.decodeIfPresent(String.self, forKey: .timeZone)
        value = try container.decodeIfPresent(Int.self, forKey: .value)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(text, forKey: .text)
        try container.encodeIfPresent(timeZone, forKey: .timeZone)
        try container.encodeIfPresent(value, forKey: .value)
    }
}
        
extension DirectionsResponse.RoutesElement.LegsElement.DepartureTime: Codable {
        
    enum CodingKeys: String, CodingKey {
        case text
        case timeZone = "time_zone"
        case value
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        text = try container.decodeIfPresent(String.self, forKey: .text)
        timeZone = try container.decodeIfPresent(String.self, forKey: .timeZone)
        value = try container.decodeIfPresent(Int.self, forKey: .value)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(text, forKey: .text)
        try container.encodeIfPresent(timeZone, forKey: .timeZone)
        try container.encodeIfPresent(value, forKey: .value)
    }
}
        
extension DirectionsResponse.RoutesElement.LegsElement.Distance: Codable {
        
    enum CodingKeys: String, CodingKey {
        case text
        case value
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        text = try container.decodeIfPresent(String.self, forKey: .text)
        value = try container.decodeIfPresent(Int.self, forKey: .value)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(text, forKey: .text)
        try container.encodeIfPresent(value, forKey: .value)
    }
}
        
extension DirectionsResponse.RoutesElement.LegsElement.Duration: Codable {
        
    enum CodingKeys: String, CodingKey {
        case text
        case value
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        text = try container.decodeIfPresent(String.self, forKey: .text)
        value = try container.decodeIfPresent(Int.self, forKey: .value)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(text, forKey: .text)
        try container.encodeIfPresent(value, forKey: .value)
    }
}
        
extension DirectionsResponse.RoutesElement.LegsElement.EndLocation: Codable {
        
    enum CodingKeys: String, CodingKey {
        case lat
        case lng
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        lat = try container.decodeIfPresent(Double.self, forKey: .lat)
        lng = try container.decodeIfPresent(Double.self, forKey: .lng)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(lat, forKey: .lat)
        try container.encodeIfPresent(lng, forKey: .lng)
    }
}
        
extension DirectionsResponse.RoutesElement.LegsElement.StartLocation: Codable {
        
    enum CodingKeys: String, CodingKey {
        case lat
        case lng
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        lat = try container.decodeIfPresent(Double.self, forKey: .lat)
        lng = try container.decodeIfPresent(Double.self, forKey: .lng)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(lat, forKey: .lat)
        try container.encodeIfPresent(lng, forKey: .lng)
    }
}
        
extension DirectionsResponse.RoutesElement.LegsElement.StepsElement: Codable {
        
    enum CodingKeys: String, CodingKey {
        case distance
        case duration
        case endLocation = "end_location"
        case htmlInstructions = "html_instructions"
        case startLocation = "start_location"
        case transitDetails = "transit_details"
        case travelMode = "travel_mode"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        distance = try container.decodeIfPresent(Distance.self, forKey: .distance)
        duration = try container.decodeIfPresent(Duration.self, forKey: .duration)
        endLocation = try container.decodeIfPresent(EndLocation.self, forKey: .endLocation)
        htmlInstructions = try container.decodeIfPresent(String.self, forKey: .htmlInstructions)
        startLocation = try container.decodeIfPresent(StartLocation.self, forKey: .startLocation)
        transitDetails = try container.decodeIfPresent(TransitDetails.self, forKey: .transitDetails)
        travelMode = try container.decodeIfPresent(String.self, forKey: .travelMode)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(distance, forKey: .distance)
        try container.encodeIfPresent(duration, forKey: .duration)
        try container.encodeIfPresent(endLocation, forKey: .endLocation)
        try container.encodeIfPresent(htmlInstructions, forKey: .htmlInstructions)
        try container.encodeIfPresent(startLocation, forKey: .startLocation)
        try container.encodeIfPresent(transitDetails, forKey: .transitDetails)
        try container.encodeIfPresent(travelMode, forKey: .travelMode)
    }
}
        
extension DirectionsResponse.RoutesElement.LegsElement.StepsElement.Distance: Codable {
        
    enum CodingKeys: String, CodingKey {
        case text
        case value
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        text = try container.decodeIfPresent(String.self, forKey: .text)
        value = try container.decodeIfPresent(Int.self, forKey: .value)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(text, forKey: .text)
        try container.encodeIfPresent(value, forKey: .value)
    }
}
        
extension DirectionsResponse.RoutesElement.LegsElement.StepsElement.Duration: Codable {
        
    enum CodingKeys: String, CodingKey {
        case text
        case value
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        text = try container.decodeIfPresent(String.self, forKey: .text)
        value = try container.decodeIfPresent(Int.self, forKey: .value)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(text, forKey: .text)
        try container.encodeIfPresent(value, forKey: .value)
    }
}
        
extension DirectionsResponse.RoutesElement.LegsElement.StepsElement.EndLocation: Codable {
        
    enum CodingKeys: String, CodingKey {
        case lat
        case lng
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        lat = try container.decodeIfPresent(Double.self, forKey: .lat)
        lng = try container.decodeIfPresent(Double.self, forKey: .lng)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(lat, forKey: .lat)
        try container.encodeIfPresent(lng, forKey: .lng)
    }
}
        
extension DirectionsResponse.RoutesElement.LegsElement.StepsElement.StartLocation: Codable {
        
    enum CodingKeys: String, CodingKey {
        case lat
        case lng
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        lat = try container.decodeIfPresent(Double.self, forKey: .lat)
        lng = try container.decodeIfPresent(Double.self, forKey: .lng)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(lat, forKey: .lat)
        try container.encodeIfPresent(lng, forKey: .lng)
    }
}
        
extension DirectionsResponse.RoutesElement.LegsElement.StepsElement.TransitDetails: Codable {
        
    enum CodingKeys: String, CodingKey {
        case arrivalStop = "arrival_stop"
        case arrivalTime = "arrival_time"
        case departureStop = "departure_stop"
        case departureTime = "departure_time"
        case headsign
        case line
        case numStops = "num_stops"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        arrivalStop = try container.decodeIfPresent(ArrivalStop.self, forKey: .arrivalStop)
        arrivalTime = try container.decodeIfPresent(ArrivalTime.self, forKey: .arrivalTime)
        departureStop = try container.decodeIfPresent(DepartureStop.self, forKey: .departureStop)
        departureTime = try container.decodeIfPresent(DepartureTime.self, forKey: .departureTime)
        headsign = try container.decodeIfPresent(String.self, forKey: .headsign)
        line = try container.decodeIfPresent(Line.self, forKey: .line)
        numStops = try container.decodeIfPresent(Int.self, forKey: .numStops)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(arrivalStop, forKey: .arrivalStop)
        try container.encodeIfPresent(arrivalTime, forKey: .arrivalTime)
        try container.encodeIfPresent(departureStop, forKey: .departureStop)
        try container.encodeIfPresent(departureTime, forKey: .departureTime)
        try container.encodeIfPresent(headsign, forKey: .headsign)
        try container.encodeIfPresent(line, forKey: .line)
        try container.encodeIfPresent(numStops, forKey: .numStops)
    }
}
        
extension DirectionsResponse.RoutesElement.LegsElement.StepsElement.TransitDetails.ArrivalStop: Codable {
        
    enum CodingKeys: String, CodingKey {
        case location
        case name
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        location = try container.decodeIfPresent(Location.self, forKey: .location)
        name = try container.decodeIfPresent(String.self, forKey: .name)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(location, forKey: .location)
        try container.encodeIfPresent(name, forKey: .name)
    }
}
        
extension DirectionsResponse.RoutesElement.LegsElement.StepsElement.TransitDetails.ArrivalStop.Location: Codable {
        
    enum CodingKeys: String, CodingKey {
        case lat
        case lng
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        lat = try container.decodeIfPresent(Double.self, forKey: .lat)
        lng = try container.decodeIfPresent(Double.self, forKey: .lng)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(lat, forKey: .lat)
        try container.encodeIfPresent(lng, forKey: .lng)
    }
}
        
extension DirectionsResponse.RoutesElement.LegsElement.StepsElement.TransitDetails.ArrivalTime: Codable {
        
    enum CodingKeys: String, CodingKey {
        case text
        case timeZone = "time_zone"
        case value
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        text = try container.decodeIfPresent(String.self, forKey: .text)
        timeZone = try container.decodeIfPresent(String.self, forKey: .timeZone)
        value = try container.decodeIfPresent(Int.self, forKey: .value)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(text, forKey: .text)
        try container.encodeIfPresent(timeZone, forKey: .timeZone)
        try container.encodeIfPresent(value, forKey: .value)
    }
}
        
extension DirectionsResponse.RoutesElement.LegsElement.StepsElement.TransitDetails.DepartureStop: Codable {
        
    enum CodingKeys: String, CodingKey {
        case location
        case name
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        location = try container.decodeIfPresent(Location.self, forKey: .location)
        name = try container.decodeIfPresent(String.self, forKey: .name)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(location, forKey: .location)
        try container.encodeIfPresent(name, forKey: .name)
    }
}
        
extension DirectionsResponse.RoutesElement.LegsElement.StepsElement.TransitDetails.DepartureStop.Location: Codable {
        
    enum CodingKeys: String, CodingKey {
        case lat
        case lng
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        lat = try container.decodeIfPresent(Double.self, forKey: .lat)
        lng = try container.decodeIfPresent(Double.self, forKey: .lng)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(lat, forKey: .lat)
        try container.encodeIfPresent(lng, forKey: .lng)
    }
}
        
extension DirectionsResponse.RoutesElement.LegsElement.StepsElement.TransitDetails.DepartureTime: Codable {
        
    enum CodingKeys: String, CodingKey {
        case text
        case timeZone = "time_zone"
        case value
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        text = try container.decodeIfPresent(String.self, forKey: .text)
        timeZone = try container.decodeIfPresent(String.self, forKey: .timeZone)
        value = try container.decodeIfPresent(Int.self, forKey: .value)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(text, forKey: .text)
        try container.encodeIfPresent(timeZone, forKey: .timeZone)
        try container.encodeIfPresent(value, forKey: .value)
    }
}
        
extension DirectionsResponse.RoutesElement.LegsElement.StepsElement.TransitDetails.Line: Codable {
        
    enum CodingKeys: String, CodingKey {
        case agencies
        case color
        case name
        case textColor = "text_color"
        case vehicle
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        agencies = try container.decodeIfPresent([AgenciesElement].self, forKey: .agencies) ?? []
        color = try container.decodeIfPresent(String.self, forKey: .color)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        textColor = try container.decodeIfPresent(String.self, forKey: .textColor)
        vehicle = try container.decodeIfPresent(Vehicle.self, forKey: .vehicle)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(agencies, forKey: .agencies)
        try container.encodeIfPresent(color, forKey: .color)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(textColor, forKey: .textColor)
        try container.encodeIfPresent(vehicle, forKey: .vehicle)
    }
}
        
extension DirectionsResponse.RoutesElement.LegsElement.StepsElement.TransitDetails.Line.AgenciesElement: Codable {
        
    enum CodingKeys: String, CodingKey {
        case name
        case url
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        url = try container.decodeIfPresent(String.self, forKey: .url)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(url, forKey: .url)
    }
}
        
extension DirectionsResponse.RoutesElement.LegsElement.StepsElement.TransitDetails.Line.Vehicle: Codable {
        
    enum CodingKeys: String, CodingKey {
        case icon
        case localIcon = "local_icon"
        case name
        case type
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        icon = try container.decodeIfPresent(String.self, forKey: .icon)
        localIcon = try container.decodeIfPresent(String.self, forKey: .localIcon)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        type = try container.decodeIfPresent(String.self, forKey: .type)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(icon, forKey: .icon)
        try container.encodeIfPresent(localIcon, forKey: .localIcon)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(type, forKey: .type)
    }
}