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

                public struct Polyline {
                    public let points: String?
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

                    public struct Polyline {
                        public let points: String?
                    }

                    public struct StartLocation {
                        public let lat: Double?
                        public let lng: Double?
                    }

                    public let distance: Distance?
                    public let duration: Duration?
                    public let endLocation: EndLocation?
                    public let polyline: Polyline?
                    public let startLocation: StartLocation?
                    public let travelMode: String?
                }

                public let distance: Distance?
                public let duration: Duration?
                public let endLocation: EndLocation?
                public let htmlInstructions: String?
                public let polyline: Polyline?
                public let startLocation: StartLocation?
                public let steps: [StepsElement]
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

        public struct OverviewPolyline {
            public let points: String?
        }
        
        public let bounds: Bounds?
        public let copyrights: String?
        public let legs: [LegsElement]
        public let overviewPolyline: OverviewPolyline?
        public let summary: String?
        public let warnings: [String]
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
        case overviewPolyline = "overview_polyline"
        case summary
        case warnings
        case waypointOrder = "waypoint_order"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        bounds = try container.decodeIfPresent(Bounds.self, forKey: .bounds)
        copyrights = try container.decodeIfPresent(String.self, forKey: .copyrights)
        legs = try container.decodeIfPresent([LegsElement].self, forKey: .legs) ?? []
        overviewPolyline = try container.decodeIfPresent(OverviewPolyline.self, forKey: .overviewPolyline)
        summary = try container.decodeIfPresent(String.self, forKey: .summary)
        warnings = try container.decodeIfPresent([String].self, forKey: .warnings) ?? []
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(bounds, forKey: .bounds)
        try container.encodeIfPresent(copyrights, forKey: .copyrights)
        try container.encode(legs, forKey: .legs)
        try container.encodeIfPresent(overviewPolyline, forKey: .overviewPolyline)
        try container.encodeIfPresent(summary, forKey: .summary)
        try container.encode(warnings, forKey: .warnings)
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
        case trafficSpeedEntry = "traffic_speed_entry"
        case viaWaypoint = "via_waypoint"
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
        case polyline
        case startLocation = "start_location"
        case steps
        case travelMode = "travel_mode"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        distance = try container.decodeIfPresent(Distance.self, forKey: .distance)
        duration = try container.decodeIfPresent(Duration.self, forKey: .duration)
        endLocation = try container.decodeIfPresent(EndLocation.self, forKey: .endLocation)
        htmlInstructions = try container.decodeIfPresent(String.self, forKey: .htmlInstructions)
        polyline = try container.decodeIfPresent(Polyline.self, forKey: .polyline)
        startLocation = try container.decodeIfPresent(StartLocation.self, forKey: .startLocation)
        steps = try container.decodeIfPresent([StepsElement].self, forKey: .steps) ?? []
        travelMode = try container.decodeIfPresent(String.self, forKey: .travelMode)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(distance, forKey: .distance)
        try container.encodeIfPresent(duration, forKey: .duration)
        try container.encodeIfPresent(endLocation, forKey: .endLocation)
        try container.encodeIfPresent(htmlInstructions, forKey: .htmlInstructions)
        try container.encodeIfPresent(polyline, forKey: .polyline)
        try container.encodeIfPresent(startLocation, forKey: .startLocation)
        try container.encode(steps, forKey: .steps)
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
        
extension DirectionsResponse.RoutesElement.LegsElement.StepsElement.Polyline: Codable {
        
    enum CodingKeys: String, CodingKey {
        case points
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        points = try container.decodeIfPresent(String.self, forKey: .points)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(points, forKey: .points)
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
        
extension DirectionsResponse.RoutesElement.LegsElement.StepsElement.StepsElement: Codable {
        
    enum CodingKeys: String, CodingKey {
        case distance
        case duration
        case endLocation = "end_location"
        case polyline
        case startLocation = "start_location"
        case travelMode = "travel_mode"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        distance = try container.decodeIfPresent(Distance.self, forKey: .distance)
        duration = try container.decodeIfPresent(Duration.self, forKey: .duration)
        endLocation = try container.decodeIfPresent(EndLocation.self, forKey: .endLocation)
        polyline = try container.decodeIfPresent(Polyline.self, forKey: .polyline)
        startLocation = try container.decodeIfPresent(StartLocation.self, forKey: .startLocation)
        travelMode = try container.decodeIfPresent(String.self, forKey: .travelMode)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(distance, forKey: .distance)
        try container.encodeIfPresent(duration, forKey: .duration)
        try container.encodeIfPresent(endLocation, forKey: .endLocation)
        try container.encodeIfPresent(polyline, forKey: .polyline)
        try container.encodeIfPresent(startLocation, forKey: .startLocation)
        try container.encodeIfPresent(travelMode, forKey: .travelMode)
    }
}
        
extension DirectionsResponse.RoutesElement.LegsElement.StepsElement.StepsElement.Distance: Codable {
        
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
        
extension DirectionsResponse.RoutesElement.LegsElement.StepsElement.StepsElement.Duration: Codable {
        
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
        
extension DirectionsResponse.RoutesElement.LegsElement.StepsElement.StepsElement.EndLocation: Codable {
        
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
        
extension DirectionsResponse.RoutesElement.LegsElement.StepsElement.StepsElement.Polyline: Codable {
        
    enum CodingKeys: String, CodingKey {
        case points
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        points = try container.decodeIfPresent(String.self, forKey: .points)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(points, forKey: .points)
    }
}
        
extension DirectionsResponse.RoutesElement.LegsElement.StepsElement.StepsElement.StartLocation: Codable {
        
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
        
extension DirectionsResponse.RoutesElement.OverviewPolyline: Codable {
        
    enum CodingKeys: String, CodingKey {
        case points
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        points = try container.decodeIfPresent(String.self, forKey: .points)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(points, forKey: .points)
    }
}
