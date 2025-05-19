//
//  SearchPlacesView.swift
//  WeatherReport
//
//  Created by Grace couch on 16/05/2025.
//

import SwiftUI

struct SearchPlacesView: View {
    @State private var vm = SearchPlacesViewModel()
    var body: some View {
        NavigationStack {
            Text("Searching for \(vm.searchText)")
                .searchable(text: $vm.searchText)
                .navigationTitle("Area search")
        }
    }
}

#Preview {
    SearchPlacesView()
}
