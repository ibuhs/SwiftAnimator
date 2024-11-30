import SwiftUI

struct ConceptView: View {
    let concept: AnimationConcept
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(concept.title)
                .font(.subheadline)
                .bold()
            Text(concept.description)
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .padding(.vertical, 4)
    }
} 