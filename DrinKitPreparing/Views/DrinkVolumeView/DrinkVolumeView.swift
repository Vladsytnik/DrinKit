//
//  DrinkVolumeView.swift
//  DrinKitPreparing
//
//  Created by user on 07.10.2024.
//

import SwiftUI

struct DrinkVolumeView: View {
    
    let segments: [String]
    let segmentsDescriptions: [String]
    let prices: [String]
    
    @State private var selectedSegmentIndex = 0
    @Environment(\.safeAreaInsets) private var safeAreaInsets
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                ToggleView(
                    selectedSegmentIndex: $selectedSegmentIndex,
                    segments: segments,
                    segmentsDescriptions: segmentsDescriptions
                )
                
                Button(action: {}) {
                    RoundedRectangle(cornerRadius: 1000, style: .continuous)
                        .foregroundColor(.blue)
                        .overlay {
                            Text(prices[selectedSegmentIndex])
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .semibold))
                        }
                }
                .padding()
            }
            .background {
                RoundedRectangle(cornerRadius: 1000, style: .circular)
                    .foregroundColor(.white)
                    .shadow(radius: 30)
            }
            .frame(height: 80)
            .frame(maxWidth: 400)
        }
        .padding(.horizontal)
        .padding(.vertical, safeAreaInsets.bottom + 4)
    }
}

struct DrinkVolumeView_Previews_Container: PreviewProvider {
    struct Container: View {
        
        private let segments = ["S", "M", "L"]
        private let segmentsDescriptions = ["250 ml", "350 ml", "500 ml"]
        private let prices = ["+ 299 руб.", "+ 349 руб.", "+ 450 руб."]
        
        var body: some View {
            DrinkVolumeView(
                segments: segments,
                segmentsDescriptions: segmentsDescriptions,
                prices: prices
            )
        }
    }
    
    static var previews: some View {
        Container()
    }
}
