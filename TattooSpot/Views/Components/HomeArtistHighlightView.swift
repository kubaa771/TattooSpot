//
//  HomeArtistHighlightView.swift
//  TattooSpot
//
//  Created by Jakub Iwaszek on 03/11/2024.
//

import SwiftUI

struct HomeArtistHighlightView: View {
    @EnvironmentObject private var router: Router

    var body: some View {
        VStack(alignment: .leading) {
            artistInfoView
            highlightImagesView
            Divider()
            labelView
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.gray, lineWidth: 1)
        )
    }
    
    var artistInfoView: some View {
        HStack(alignment: .top) {
            Image(systemName: "person.crop.circle.fill") // image -> should be async from API
                .resizable()
                .frame(width: 40, height: 40)
            VStack(alignment: .leading) {
                Text("vsxdkkaaartist") // name -> from API
                HStack {
                    Text("130 Photos")  // from API
                    Divider()
                        .frame(height: 20)
                    Text("49 Flashes") // from API
                }
                .foregroundStyle(.secondary)
            }
        }
    }
    
    var highlightImagesView: some View {
        HStack {
            ForEach(1...5, id: \.self) { index in
                Color.green // replace with images
                    .frame(width: 60, height: 80)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .overlay {
                        if index == 5 {
                            ZStack {
                                Color.black
                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                                    .opacity(0.5)
                                Text("See more")
                                    .foregroundStyle(.white)
                            }
                            .onTapGesture {
                                router.navigate(to: .artistProfile)
                            }
                        }
                    }
            }
        }
    }
    
    var labelView: some View {
        Button {
            router.navigate(to: .artistProfile)
        } label: {
            Text("See more and book ➤")
                .foregroundStyle(.secondary)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    HomeArtistHighlightView()
}
