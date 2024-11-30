import SwiftUI

struct AnimationCard: View {
    @State private var isAnimating = false
    
    var body: some View {
        VStack {
            // Preview area
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(.secondary.opacity(0.1))
                
                Circle()
                    .fill(.blue)
                    .frame(width: 50, height: 50)
                    .offset(x: isAnimating ? 100 : -100)
                    .animation(.spring(duration: 1), value: isAnimating)
            }
            .frame(height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            
            // Controls
            HStack {
                Button(action: { isAnimating.toggle() }) {
                    Label(isAnimating ? "Reset" : "Play", 
                          systemImage: isAnimating ? "arrow.counterclockwise" : "play.fill")
                }
                .buttonStyle(.bordered)
                
                Spacer()
                
                Button(action: {}) {
                    Label("View Code", systemImage: "doc.text")
                }
                .buttonStyle(.bordered)
            }
            .padding(.top, 8)
        }
        .padding()
        .background(Color(uiColor: .systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(radius: 2)
    }
}

// Preview
#Preview {
    AnimationCard()
        .padding()
} 