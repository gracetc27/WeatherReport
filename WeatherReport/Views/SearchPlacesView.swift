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
            if vm.isSearching {
                Text("Searching for \(vm.searchText)")
            } else {
                List {
                    ForEach(vm.coordinates) { place in
                        Button(place.name) {

                        }
                    }
                }
                .searchable(text: $vm.searchText)
                .navigationTitle("Area search")
                .onSubmit(of: .search) {
                    vm.searchPlaces()
                }
            }
        }
    }
}

#Preview {
    SearchPlacesView()
}
