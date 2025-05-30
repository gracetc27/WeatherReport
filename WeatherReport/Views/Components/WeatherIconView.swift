//
//  WeatherIconView.swift
//  WeatherReport
//
//  Created by Grace couch on 29/05/2025.
//

import SwiftUI

struct WeatherIconView: View {
    let url: URL
    var body: some View {
        AsyncImage(url: url) { image in
            Color.clear
                .overlay {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)

                }
        } placeholder: {
            ProgressView()
        }
    }
}

#Preview {
    WeatherIconView(url: URL(string: "gytf")!)
}
