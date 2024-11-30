import SwiftUI

struct FeaturedCard: View {
    let category: AnimationCategory
    @State private var isAnimating = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Animation preview
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(category.gradient)
                
                category.previewContent(isAnimating: isAnimating)
            }
            .frame(height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            
            // Text content
            VStack(alignment: .leading, spacing: 4) {
                Text(category.title)
                    .font(.title2)
                    .bold()
                    .foregroundStyle(.primary)
                
                Text(category.description)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .lineLimit(2)
            }
            .padding(.horizontal, 8)
            .padding(.vertical, 12)
        }
        .background(Color(uiColor: .systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(radius: 2)
        .onAppear {
            withAnimation(.spring(duration: 2).repeatForever(autoreverses: true)) {
                isAnimating = true
            }
        }
    }
}

#Preview {
    ScrollView(.horizontal) {
        HStack {
            ForEach(AnimationCategory.allCases) { category in
                FeaturedCard(category: category)
                    .frame(width: 300)
            }
        }
        .padding()
    }
} 