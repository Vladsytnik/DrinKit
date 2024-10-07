//
//  ToggleView.swift
//  DrinKitPreparing
//
//  Created by user on 06.10.2024.
//

import SwiftUI

struct ToggleView: View {
    
    @Binding var selectedSegmentIndex: Int
    
    let segments: [String]
    let segmentsDescriptions: [String]
    
    @State private var position: CGPoint = .zero
    @State private var segmentItemWidth: CGFloat = 0
    
    private let offsetVal: CGFloat = 8
    private let zStackSpace: CoordinateSpace = .named("ZStack")
    
    var body: some View {
        ZStack {
            HStack(spacing: 5) {
                ForEach(segments.indices, id: \.self) { index in
                    
                    let startOffset: CGFloat = index == 0 ? offsetVal : 0
                    let endOffset: CGFloat = index == segments.count - 1 ? offsetVal : 0
                    
                    SegmentItem(
                        text: segments[index],
                        offset: .init(top: 0, leading: startOffset, bottom: 0, trailing: endOffset),
                        segmentItemWidth: $segmentItemWidth
                    ) {
                        selectedSegmentIndex = index
                    }
                    .background {
                        GeometryReader { reader in
                            Spacer()
                                .onAppear {
                                    position = .init(
                                        x: reader.frame(in: .named(zStackSpace)).origin.x + segmentItemWidth / 2 + offsetVal,
                                        y: reader.frame(in: .named(zStackSpace)).origin.y + reader.size.height / 2
                                    )
                                }
                        }
                    }
                }
            }
            .background {
                RoundedRectangle(cornerRadius: 1000, style: .continuous)
                    .foregroundColor(.gray.opacity(0.2))
            }
            
            SelectorView(
                title: segments[selectedSegmentIndex],
                subtitle: segmentsDescriptions[selectedSegmentIndex],
                selectedIndex: $selectedSegmentIndex,
                segmentItemWidth: $segmentItemWidth,
                position: $position,
                circleWidth: 60
            )
        }
        .coordinateSpace(name: zStackSpace)
    }
}

struct SegmentItem: View {
    
    let text: String
    let edges: EdgeInsets = .init(top: 14, leading: 16, bottom: 14, trailing: 16)
    let offset: EdgeInsets
    
    @Binding var segmentItemWidth: CGFloat
    
    var onTap: (() -> Void)
    
    var body: some View {
        Text(text)
            .foregroundColor(.black)
            .padding(EdgeInsets(
                top: edges.top,
                leading: edges.leading + offset.leading,
                bottom: edges.bottom,
                trailing: edges.trailing + offset.trailing
            ))
            .background {
                GeometryReader { geo in
                    Spacer()
                        .onAppear {
                            segmentItemWidth = geo.size.width
                        }
                }
            }
            .onTapGesture {
                onTap()
            }
    }
}

struct SelectorView: View {
    
    var title: String
    var subtitle: String
    
    @Binding var selectedIndex: Int
    @Binding var segmentItemWidth: CGFloat
    @Binding var position: CGPoint
    
    let circleWidth: CGFloat
    
    var body: some View {
        Circle()
            .overlay {
                VStack(spacing: 2) {
                    Text(title)
                        .foregroundColor(.black)
                    Text(subtitle)
                        .foregroundColor(.black)
                        .font(.system(size: 10))
                }
            }
            .foregroundColor(.white)
            .frame(width: circleWidth)
            .position(position)
            .shadow(radius: 10)
            .offset(.init(width: CGFloat(selectedIndex) * segmentItemWidth, height: 0))
            .animation(.bouncy.speed(2), value: selectedIndex)
    }
}

struct ToggleView_Previews_Container: PreviewProvider {
    struct Container: View {
        @State var selectedIndex = 1
        
        var body: some View {
            ToggleView(
                selectedSegmentIndex: $selectedIndex,
                segments: ["S", "M", "L"],
                segmentsDescriptions: ["250 ml", "350 ml", "500 ml"]
            )
            .background {
                Rectangle()
                    .foregroundColor(.gray.opacity(0.1))
            }
        }
    }
    
    static var previews: some View {
        Container()
    }
}
