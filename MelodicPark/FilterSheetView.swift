//
//  FilterSheetView.swift
//  MelodicPark
//
//  Created by 嚴富莊 on 22/5/2023.
//

import SwiftUI

struct FilterSheetView: View {
    
    @Environment(\.presentationMode) var presentationMode

    @Binding var selectedCountry: String
    @Binding var selectedMediaType: String

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Country")) {
                    // Add Picker for country selection
                    Picker("Country", selection: $selectedCountry) {
                        Text("United States").tag("US")
                        Text("United Kingdom").tag("GB")
                        // Add more countries as needed
                    }
                }
                Section(header: Text("Media Type")) {
                    // Add Picker for media type selection
                    Picker("Media Type", selection: $selectedMediaType) {
                        Text("Music").tag("music")
                        Text("Movies").tag("movie")
                        // Add more media types as needed
                    }
                }
            }
            .navigationTitle("Filter")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
}

struct FilterSheetView_Previews: PreviewProvider {
    static var previews: some View {
        FilterSheetView(selectedCountry: .constant("US"), selectedMediaType: .constant("music"))
    }
}



