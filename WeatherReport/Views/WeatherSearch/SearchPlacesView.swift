//
//  SearchPlacesView.swift
//  WeatherReport
//
//  Created by Grace couch on 16/05/2025.
//

import SwiftUI

struct SearchPlacesView: View {
    @State private var coordTask: Task<Void, Never>?
    @State private var weatherTask: Task<Void, Never>?
    @State private var viewModel: SearchPlacesViewModel
    init(placeManager: PlaceManager, service: WeatherServiceProtocol) {
        self._viewModel = State(initialValue: SearchPlacesViewModel(placeManager: placeManager, service: service))
    }

    var body: some View {
        NavigationStack {
            if viewModel.isSearching {
                Text("Searching for \(viewModel.searchText)")
            } else {
                List {
                    ForEach(viewModel.coordinates) { place in
                        Button {
                            viewModel.saveRecentPlace()
                            weatherTask?.cancel()
                            weatherTask = Task {
                                await viewModel.getWeatherForCoord()
                            }
                            viewModel.weatherSheetIsActive = true
                        } label: {
                            Text(place.name)
                        }
                    }
                }
                .sheet(isPresented: $viewModel.weatherSheetIsActive) {
                    if let place = viewModel.place,
                       let weather = viewModel.weather,
                       let iconUrl = viewModel.iconUrl {
                        WeatherDetailView(
                            place: place,
                            weather: weather,
                            iconUrl: iconUrl
                        )
                            .padding(.vertical)
                    }
                }
                .searchable(text: $viewModel.searchText)
                .navigationTitle("City search")
                .onSubmit(of: .search) {
                    coordTask?.cancel()
                    coordTask = Task {
                        await viewModel.searchPlaces()
                    }
                }
                .alert(isPresented: $viewModel.isShowingPlaceError, error: viewModel.placeError, actions: {})
                .alert(isPresented: $viewModel.isShowingWeatherError, error: viewModel.weatherError, actions: {})
                .alert(isPresented: $viewModel.isShowingSaveError, error: viewModel.saveError, actions: {})
            }
        }
    }
}

#Preview {
    SearchPlacesView(placeManager: PlaceManager(), service: MockWeatherService())
}
