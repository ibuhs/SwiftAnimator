import SwiftUI

struct EnhancedAnimationCard: View {
    let example: AnimationExample
    @State private var isAnimating = false
    @State private var showingCode = false
    
    var body: some View {
        VStack(spacing: 0) {
            // Preview area
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(.secondary.opacity(0.1))
                
                AnyView(_fromValue: example.content(isAnimating))
            }
            .frame(height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            
            // Title and description
            VStack(alignment: .leading, spacing: 4) {
                Text(example.title)
                    .font(.headline)
                
                Text(example.description)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 12)
            
            // View Code button
            Button(action: { showingCode.toggle() }) {
                Label("View Code", systemImage: "doc.text")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.bordered)
        }
        .padding()
        .background(Color(uiColor: .systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(radius: 2)
        .sheet(isPresented: $showingCode) {
            CodePreviewView(example: example)
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
                isAnimating = true
            }
        }
    }
}

struct CodePreviewView: View {
    let example: AnimationExample
    @Environment(\.dismiss) private var dismiss
    @State private var selectedTab = 0
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // Tab picker
                Picker("View Mode", selection: $selectedTab) {
                    Text("Code").tag(0)
                    Text("Explanation").tag(1)
                }
                .pickerStyle(.segmented)
                .padding()
                
                TabView(selection: $selectedTab) {
                    // Code tab
                    ScrollView {
                        VStack(alignment: .leading, spacing: 16) {
                            // Implementation section
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Implementation")
                                    .font(.headline)
                                
                                Text(example.codePreview)
                                    .font(.system(.body, design: .monospaced))
                                    .padding()
                                    .background(.secondary.opacity(0.1))
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                            }
                            
                            // Usage example section
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Usage Example")
                                    .font(.headline)
                                
                                Text(example.usageExample)
                                    .font(.system(.body, design: .monospaced))
                                    .padding()
                                    .background(.secondary.opacity(0.1))
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                            }
                        }
                        .padding()
                    }
                    .tag(0)
                    
                    // Explanation tab
                    ScrollView {
                        VStack(alignment: .leading, spacing: 20) {
                            // Overview section
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Overview")
                                    .font(.headline)
                                Text(example.explanation.overview)
                            }
                            
                            // Key concepts section
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Key Concepts")
                                    .font(.headline)
                                ForEach(example.explanation.keyConcepts, id: \.title) { concept in
                                    ConceptView(concept: concept)
                                }
                            }
                            
                            // Tips section
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Tips & Best Practices")
                                    .font(.headline)
                                ForEach(example.explanation.tips, id: \.self) { tip in
                                    HStack(alignment: .top, spacing: 8) {
                                        Image(systemName: "lightbulb.fill")
                                            .foregroundStyle(.yellow)
                                        Text(tip)
                                    }
                                }
                            }
                        }
                        .padding()
                    }
                    .tag(1)
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
            }
            .navigationTitle(example.title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") { dismiss() }
                }
            }
        }
    }
}

//struct ConceptView: View {
//    let concept: AnimationConcept
//    
//    var body: some View {
//        VStack(alignment: .leading, spacing: 4) {
//            Text(concept.title)
//                .font(.subheadline)
//                .bold()
//            Text(concept.description)
//                .font(.subheadline)
//                .foregroundStyle(.secondary)
//        }
//        .padding(.vertical, 4)
//    }
//} 
