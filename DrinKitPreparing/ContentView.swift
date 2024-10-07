//
//  ContentView.swift
//  DrinKitPreparing
//
//  Created by user on 06.10.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isAppeared = false
    
    private let segments = ["S", "M", "L"]
    private let segmentsDescriptions = ["250 ml", "350 ml", "500 ml"]
    private let prices = ["+ 299 руб.", "+ 349 руб.", "+ 450 руб."]
    
    @Environment(\.safeAreaInsets) private var safeAreaInsets
    
    var body: some View {
        ZStack {
            MyScrollView()
            
            DrinkVolumeView(
                segments: segments,
                segmentsDescriptions: segmentsDescriptions,
                prices: prices
            )
            .offset(y: isAppeared ? 0 : 100)
            .opacity(isAppeared ? 1 : 0)
            .animation(.bouncy.delay(0.5), value: isAppeared)
        }
        .ignoresSafeArea()
        .onAppear {
            isAppeared = true
        }
    }
}


#Preview {
    ContentView()
}
