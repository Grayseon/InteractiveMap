//
//  ContentView.swift
//  Examples
//
//  Created by GrandSir on 19.09.2022.
//

import SwiftUI
import InteractiveMap

struct ContentView: View {
    @State private var clickedProvince = Province.EmptyProvince
    var body: some View {
        VStack {
            Text(clickedProvince.name.isEmpty ? "" : "\(clickedProvince.name) is clicked!" )
                .font(.largeTitle)
                .padding(.bottom, 15)
            MapView(svgName: "tr") { province in // is a Province
                ProvinceShape(province)
                    .initWithAttributes(.init(strokeWidth: 2, strokeColor: .black, background: .black.opacity(0.3)))
                    .shadow(color: clickedProvince == province ? .white : .clear, radius: 6)
                    .onTapGesture {
                        clickedProvince = province
                    }
                    .animation(.easeInOut(duration: 0.2), value: clickedProvince)
                    .zIndex(clickedProvince == province ? 2 : 1)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
