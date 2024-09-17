//
//  JournalDetailsView.swift
//  LandmarkMapApp
//
//  Created by Riyan Pahuja on 17/9/2024.
//

import SwiftUI

struct JournalDetailsView: View {
    
    var journal: Journal
    var body: some View {
        ScrollView {
            Text(journal.location.name)
                .font(.title2)
                .fontWeight(.black)
                .foregroundStyle(.primary)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y:15)
                .padding()
            
            VStack(alignment: .leading) {
                Text("Images")
                    .font(.title3)
                    .fontWeight(.black)
                    .foregroundStyle(.primary)
                    .padding(.horizontal)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(journal.images, id: \.self) { image in
                            if let image = UIImage(data: image) {
                                Image(uiImage: image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 150, height: 150)
                                    .cornerRadius(10)
                                    .shadow(radius: 5)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
            
            VStack(alignment: .leading) {
                Text("Notes")
                    .font(.title3)
                    .fontWeight(.black)
                    .foregroundStyle(.primary)
                
                TextEditor(text: .constant(journal.notes))
                    .frame(height: 200)
                    .background(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 1))
                    .cornerRadius(10)
                    .shadow(radius: 5)
            }
            .padding()
        }
    }
}
