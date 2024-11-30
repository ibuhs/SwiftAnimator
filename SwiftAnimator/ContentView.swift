//
//  ContentView.swift
//  SwiftAnimator
//
//  Created by Jin on 2024-11-29.
//

import SwiftUI

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

struct ContentView: View {
    @StateObject private var viewModel = AnimationsViewModel()
    @State private var selectedTab = "Featured"
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background gradient
                LinearGradient(colors: [.black.opacity(0.8), .black],
                             startPoint: .top,
                             endPoint: .bottom)
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 30) {
                        // Header Section
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Swift")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                            Text("Animator")
                                .font(.title)
                                .foregroundStyle(.blue)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        
                        // Tab Selection
                        HStack(spacing: 20) {
                            ForEach(["Featured", "Categories", "Latest"], id: \.self) { tab in
                                TabButton(title: tab, 
                                         isSelected: selectedTab == tab,
                                         action: { selectedTab = tab })
                            }
                        }
                        .padding(.horizontal)
                        
                        // Content based on selected tab
                        switch selectedTab {
                        case "Featured":
                            FeaturedContent(viewModel: viewModel)
                        case "Categories":
                            CategoriesContent(viewModel: viewModel)
                        case "Latest":
                            LatestContent(viewModel: viewModel)
                        default:
                            EmptyView()
                        }
                    }
                    .padding(.top)
                }
            }
        }
    }
}

struct TabButton: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .foregroundStyle(isSelected ? .white : .gray)
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
                .background {
                    if isSelected {
                        Capsule()
                            .fill(.blue)
                    }
                }
        }
    }
}

struct FeaturedContent: View {
    @ObservedObject var viewModel: AnimationsViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            // Spotlight Animation
            SpotlightCard()
                .padding(.horizontal)
            
            // Featured Categories
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(AnimationCategory.allCases) { category in
                        NavigationLink {
                            CategoryDetailView(category: category, viewModel: viewModel)
                        } label: {
                            FeaturedCard(category: category)
                                .frame(width: 300)
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct SpotlightCard: View {
    @State private var isAnimating = false
    let animation: AnimationExample
    
    init() {
        // Get a random animation from all categories
        let allAnimations = AnimationExample.basicExamples +
                          AnimationExample.springExamples +
                          AnimationExample.transitionExamples +
                          AnimationExample.keyframeExamples +
                          AnimationExample.pathExamples
        
        animation = allAnimations.randomElement() ?? AnimationExample.basicExamples[0]
    }
    
    var body: some View {
        NavigationLink {
            AnimationDetailView(example: animation)
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .fill(
                        LinearGradient(colors: [.purple, .blue],
                                     startPoint: .topLeading,
                                     endPoint: .bottomTrailing)
                    )
                
                HStack {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Animation of the Day")
                            .font(.title2)
                            .bold()
                            .foregroundStyle(.white)
                        
                        Text(animation.title)
                            .font(.headline)
                            .foregroundStyle(.white.opacity(0.9))
                        
                        Text(animation.description)
                            .foregroundStyle(.white.opacity(0.8))
                        
                        Spacer()
                        
                        Text("Learn More")
                            .font(.headline)
                            .foregroundStyle(.white)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 16)
                            .background(.ultraThinMaterial)
                            .clipShape(Capsule())
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    // Animation preview
                    ZStack {
                        Circle()
                            .fill(.ultraThinMaterial)
                            .frame(width: 100, height: 100)
                        
                        AnyView(_fromValue: animation.content(isAnimating))
                    }
                    .padding()
                }
            }
            .frame(height: 200)
        }
        .buttonStyle(.plain)
        .onAppear {
            withAnimation(.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
                isAnimating = true
            }
        }
    }
}

struct AnimationDetailView: View {
    let example: AnimationExample
    @State private var isAnimating = false
    @State private var showingCode = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Preview area
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(.secondary.opacity(0.1))
                        .frame(height: 300)
                    
                    Group {
                        AnyView(_fromValue: example.content(isAnimating))
                    }
                }
                .padding()
                
                // Description
                VStack(alignment: .leading, spacing: 16) {
                    Text(example.description)
                        .font(.headline)
                    
                    Text(example.explanation.overview)
                        .foregroundStyle(.secondary)
                    
                    // Key concepts
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Key Concepts")
                            .font(.headline)
                        
                        ForEach(example.explanation.keyConcepts, id: \.title) { concept in
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
                    
                    // Tips
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
        }
        .navigationTitle(example.title)
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button(action: { showingCode.toggle() }) {
                    Label("View Code", systemImage: "doc.text")
                }
            }
        }
        .sheet(isPresented: $showingCode) {
            CodePreviewView(example: example)
        }
        .onAppear {
            isAnimating = true
        }
    }
}

struct CategoriesContent: View {
    @ObservedObject var viewModel: AnimationsViewModel
    
    let columns = [
        GridItem(.adaptive(minimum: 160), spacing: 16)
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 16) {
            ForEach(AnimationCategory.allCases) { category in
                NavigationLink {
                    CategoryDetailView(category: category, viewModel: viewModel)
                } label: {
                    CategoryCard(category: category, viewModel: viewModel)
                }
            }
        }
        .padding(.horizontal)
    }
}

struct LatestContent: View {
    @ObservedObject var viewModel: AnimationsViewModel
    
    var body: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 300), spacing: 20)],
                  spacing: 20) {
            ForEach(viewModel.animations.prefix(4)) { example in
                EnhancedAnimationCard(example: example)
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    ContentView()
}

