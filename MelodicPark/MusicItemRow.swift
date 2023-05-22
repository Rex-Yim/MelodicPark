//
//  MusicItemRow.swift
//  MelodicPark
//
//  Created by 嚴富莊 on 22/5/2023.
//

import SwiftUI

struct MusicItemRow: View {
    let musicItem: MusicItem

    var body: some View {
        HStack {
            if let urlString = musicItem.artworkUrl60, let url = URL(string: urlString) {
                AsyncImage(url: url)
                    .frame(width: 60, height: 60)
            }
            VStack(alignment: .leading) {
                Text(musicItem.trackName ?? "Unknown Track")
                    .font(.headline)
                Text(musicItem.artistName)
                    .font(.subheadline)
                Text(musicItem.collectionName ?? "Unknown Album")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
            if let genre = musicItem.primaryGenreName {
                Text(genre)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
    }
}
