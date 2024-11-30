import Foundation

struct AnimationData: Codable, Identifiable {
    let id: UUID
    let title: String
    let description: String
    let categoryId: UUID
    let codePreview: String
    let usageExample: String
    let overview: String
    let createdAt: Date
    let updatedAt: Date
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case categoryId = "category_id"
        case codePreview = "code_preview"
        case usageExample = "usage_example"
        case overview
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

struct AnimationConceptData: Codable, Identifiable {
    let id: UUID
    let animationId: UUID
    let title: String
    let description: String
    let createdAt: Date
    
    enum CodingKeys: String, CodingKey {
        case id
        case animationId = "animation_id"
        case title
        case description
        case createdAt = "created_at"
    }
}

struct AnimationTipData: Codable, Identifiable {
    let id: UUID
    let animationId: UUID
    let tip: String
    let createdAt: Date
    
    enum CodingKeys: String, CodingKey {
        case id
        case animationId = "animation_id"
        case tip
        case createdAt = "created_at"
    }
} 