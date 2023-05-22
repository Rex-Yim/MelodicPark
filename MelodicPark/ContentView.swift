//
//  ContentView.swift
//  MelodicPark
//
//  Created by 嚴富莊 on 22/5/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    @State private var searchResults: [MusicItem] = []

    @State private var isFilterSheetPresented = false
    @State private var selectedCountry = "US"
    @State private var selectedMediaType = "music"
    
    var body: some View {
        NavigationView {
            List(searchResults, id: \.trackId) { musicItem in
                MusicItemRow(musicItem: musicItem)
            }
            .searchable(text: $searchText, prompt: "Search Music")
            .onSubmit(of: .search) {
                withAnimation {
                    performSearch(query: searchText, country: selectedCountry, mediaType: selectedMediaType)
                }
            }
            .navigationTitle("MelodicPark")
            .navigationBarItems(trailing: Button(action: {
                isFilterSheetPresented = true
            }) {
                Image(systemName: "line.horizontal.3.decrease.circle")
                    .font(.title)
                    .foregroundColor(.accentColor)
            })
            .sheet(isPresented: $isFilterSheetPresented) {
                FilterSheetView(selectedCountry: $selectedCountry, selectedMediaType: $selectedMediaType)
            }
        }
    }
    
    func performSearch(query: String, country: String, mediaType: String) {
        search(query: query, country: country, mediaType: mediaType, offset: 0, limit: 20) { result in
            switch result {
            case .success(let musicItems):
                DispatchQueue.main.async {
                    searchResults = musicItems
                }
            case .failure(let error):
                print("Error: \(error)")
                // Handle the error and update the UI accordingly
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
