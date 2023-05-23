# MelodicPark
KEYSOC interview code test

Make sure using mac devices with Xcode installed
1. Download the project
2. Open MelodicPark.xcodeproj file
3. Hit "RUN" button or ⌘ R and wait for simulator loading

MelodicParkApp.swift
-choosing ContentView to become the inital view

ContentView.swift
-main UI(list, searchBar, appTitle, filterButton)
-state variables(searchText, searchResults, selectedCountry, selectedMediaType, isFilterSheetPresented)
-when users clicked "Search" button on keyboard, the "searchText" state variable will be submitted to the "performSearch" function
-"performSearch" function will return "musicItems" data struct and update "searchResults" state variable
-UI update will be reflected on "List" view and "MusicItemRow" view

DataModel.swift
-"MusicItem" data struct, storing one single searchResults
-"SearchResponse" data struct, caching arrays of searchResults

FilterSheetView.swift
-sheetView for users to select Country and MediaType

MusicItemRow.swift
-contains songs item row UI 

iTunesAPI.swift
-black box magic that works miraclely

Developed by RexYim under SwiftUI framework
with the help of GPT-4
