//
//  Copyright © 2018 Company. All rights reserved.
//

import Foundation

public struct PredictionsResponse {

    public struct PredictionsElement {

        public struct MatchedSubstringsElement {
            public let length: Int?
            public let offset: Int?
        }

        public struct StructuredFormatting {

            public struct MainTextMatchedSubstringsElement {
                public let length: Int?
                public let offset: Int?
            }

            public let mainText: String?
            public let mainTextMatchedSubstrings: [MainTextMatchedSubstringsElement]
            public let secondaryText: String?
        }

        public struct TermsElement {
            public let offset: Int?
            public let value: String?
        }

        public let description: String?
        public let id: String?
        public let matchedSubstrings: [MatchedSubstringsElement]
        public let placeId: String?
        public let reference: String?
        public let structuredFormatting: StructuredFormatting?
        public let terms: [TermsElement]
        public let types: [String]
    }

    public let predictions: [PredictionsElement]
    public let status: String?
}

// ---------------------------------------------------------------------------
// MARK: - Codable
// ---------------------------------------------------------------------------
        
extension PredictionsResponse: Codable {
        
    enum CodingKeys: String, CodingKey {
        case predictions
        case status
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        predictions = try container.decodeIfPresent([PredictionsElement].self, forKey: .predictions) ?? []
        status = try container.decodeIfPresent(String.self, forKey: .status)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(predictions, forKey: .predictions)
        try container.encodeIfPresent(status, forKey: .status)
    }
}
        
extension PredictionsResponse.PredictionsElement: Codable {
        
    enum CodingKeys: String, CodingKey {
        case description
        case id
        case matchedSubstrings = "matched_substrings"
        case placeId = "place_id"
        case reference
        case structuredFormatting = "structured_formatting"
        case terms
        case types
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        description = try container.decodeIfPresent(String.self, forKey: .description)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        matchedSubstrings = try container.decodeIfPresent([MatchedSubstringsElement].self, forKey: .matchedSubstrings) ?? []
        placeId = try container.decodeIfPresent(String.self, forKey: .placeId)
        reference = try container.decodeIfPresent(String.self, forKey: .reference)
        structuredFormatting = try container.decodeIfPresent(StructuredFormatting.self, forKey: .structuredFormatting)
        terms = try container.decodeIfPresent([TermsElement].self, forKey: .terms) ?? []
        types = try container.decodeIfPresent([String].self, forKey: .types) ?? []
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encode(matchedSubstrings, forKey: .matchedSubstrings)
        try container.encodeIfPresent(placeId, forKey: .placeId)
        try container.encodeIfPresent(reference, forKey: .reference)
        try container.encodeIfPresent(structuredFormatting, forKey: .structuredFormatting)
        try container.encode(terms, forKey: .terms)
        try container.encode(types, forKey: .types)
    }
}
        
extension PredictionsResponse.PredictionsElement.MatchedSubstringsElement: Codable {
        
    enum CodingKeys: String, CodingKey {
        case length
        case offset
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        length = try container.decodeIfPresent(Int.self, forKey: .length)
        offset = try container.decodeIfPresent(Int.self, forKey: .offset)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(length, forKey: .length)
        try container.encodeIfPresent(offset, forKey: .offset)
    }
}
        
extension PredictionsResponse.PredictionsElement.StructuredFormatting: Codable {
        
    enum CodingKeys: String, CodingKey {
        case mainText = "main_text"
        case mainTextMatchedSubstrings = "main_text_matched_substrings"
        case secondaryText = "secondary_text"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        mainText = try container.decodeIfPresent(String.self, forKey: .mainText)
        mainTextMatchedSubstrings = try container.decodeIfPresent([MainTextMatchedSubstringsElement].self, forKey: .mainTextMatchedSubstrings) ?? []
        secondaryText = try container.decodeIfPresent(String.self, forKey: .secondaryText)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(mainText, forKey: .mainText)
        try container.encode(mainTextMatchedSubstrings, forKey: .mainTextMatchedSubstrings)
        try container.encodeIfPresent(secondaryText, forKey: .secondaryText)
    }
}
        
extension PredictionsResponse.PredictionsElement.StructuredFormatting.MainTextMatchedSubstringsElement: Codable {
        
    enum CodingKeys: String, CodingKey {
        case length
        case offset
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        length = try container.decodeIfPresent(Int.self, forKey: .length)
        offset = try container.decodeIfPresent(Int.self, forKey: .offset)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(length, forKey: .length)
        try container.encodeIfPresent(offset, forKey: .offset)
    }
}
        
extension PredictionsResponse.PredictionsElement.TermsElement: Codable {
        
    enum CodingKeys: String, CodingKey {
        case offset
        case value
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        offset = try container.decodeIfPresent(Int.self, forKey: .offset)
        value = try container.decodeIfPresent(String.self, forKey: .value)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(offset, forKey: .offset)
        try container.encodeIfPresent(value, forKey: .value)
    }
}