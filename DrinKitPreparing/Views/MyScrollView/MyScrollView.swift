//
//  MyScrollView.swift
//  DrinKitPreparing
//
//  Created by user on 07.10.2024.
//

import SwiftUI

struct MyScrollView: View {
    @Environment(\.safeAreaInsets) private var safeAreaInsets
    
    var body: some View {
        ScrollView {
            VStack {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(height: safeAreaInsets.top)
                
                ForEach(0..<100) { index in
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundColor(.gray.opacity(0.1))
                        .frame(height: .random(in: 20...200))
                        .padding(.horizontal)
                }
                
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(height: safeAreaInsets.bottom + 80 + 16)
            }
        }
    }
}

#Preview {
    MyScrollView()
}
