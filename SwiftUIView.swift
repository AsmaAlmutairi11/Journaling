//
//  SwiftUIView.swift
//  Journaling
//
//  Created by Asma Mohammed on 24/04/1446 AH.
//

import SwiftUI

struct SwiftUIView: View {
    @State var journals: [Journal] = []

    var body: some View {
        List{
            ForEach (journals) { entry in
                    VStack(alignment: .leading) {
                        HStack {
                            Text(Journal.title)
                                .font(.system(size: 24, weight: .semibold))
                            .foregroundColor(.purple)
//                        Text(Journal.date, formatter: currentDate)
//                            .font(.subheadline)
//                            .foregroundColor(.gray)
                        Text(Journal.text)
                            .font(.body)
                            .foregroundColor(.black)
                    }
                    Spacer()
                }
                .swipeActions {
                    Button(action: {
                        journals[index].isBookmarked = (journals[index].isBookmarked == .Bookmarked) ? .NotBookmarked : .Bookmarked
                    }) {
                        Image(systemName: entry.Bookmarked ? "bookmark.fill" : "bookmark")
                            .font(.system(size: 24))
                            .foregroundColor(.purple)
                    }
                }
            }
        }    }
}

#Preview {
    SwiftUIView()
}
