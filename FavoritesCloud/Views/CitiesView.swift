//
//  CitiesView.swift
//  Favorites
//
//  Created by Noah Flood on 7/28/25.
//

import SwiftUI

struct CitiesView: View {
    
    // remember, these are kind of like instance variables. they can be set when
    // an instance of CitiesView is created
    @EnvironmentObject private var favorites : FavoritesViewModel
    @Binding var searchText: String // by making it @Binding, this means that it changes
    
    // FOR FAVORITES TAB
    // will be passed when the view is instantiated
    // so that we can reuse this view for when we need to filter by favorites AND searchText, or just searchText
    var showFavoritesOnly : Bool
    
    var body: some View {
        ScrollView {
            LazyVStack { // creates a vert-scrolling list that loads stuff efficiently
                // goal: iterate over all the cities and create a city card view for each one
                // while reading the city data directly from the viewModel
                
                // we're going to use a function called filteredCities() which displays the filtered
                // cities based on an active State variable that is changing based on
                // user input. convenient.
                ForEach(favorites.filteredCities(
                    searchText: searchText,
                    showFavoritesOnly: showFavoritesOnly)) { city in
                    CityCardView(city: city) // this view is established elswhere and will nicely show a card given content.
                }
            }
            .padding()
        }
    }
}


#Preview {
    CitiesView(searchText: .constant(""), showFavoritesOnly: false)
        .environmentObject(FavoritesViewModel()) // example view model
}

