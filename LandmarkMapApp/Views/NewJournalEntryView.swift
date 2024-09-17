//
//  NewJournalEntryView.swift
//  LandmarkMapApp
//
//  Created by Riyan Pahuja on 17/9/2024.
//

import SwiftUI

struct NewJournalEntryView: View {
    @EnvironmentObject var jvm: JournalViewModel
    @State private var notes: String = ""
    // State to manage image selection
    @State private var selectedImages: [UIImage] = []
    @State private var isPickerPresented = false
    @Environment(\.dismiss) private var dismissSheet
    @State var showAlert: Bool = false
    var body: some View {
        NavigationStack {
            ScrollView {
                Text(jvm.currentSelectedLocation?.name ?? "Hyde Park")
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundStyle(.primary)
                    .frame(height: 55)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y:15)
                    .padding()
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Images")
                            .font(.title3)
                            .fontWeight(.black)
                        .foregroundStyle(.primary)
                        
                        if !selectedImages.isEmpty {
                            Spacer()
                            
                            Button("Add More") {
                                isPickerPresented.toggle()
                            }
                        } else {
                            Spacer()
                        }
                    }
                    .padding(.horizontal)
                    
                    // Image Carousel
                    if !selectedImages.isEmpty {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 10) {
                                ForEach(selectedImages, id: \.self) { image in
                                    Image(uiImage: image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 150, height: 150)
                                        .cornerRadius(10)
                                        .shadow(radius: 5)
                                }
                            }
                            .padding(.horizontal)
                        }
                    } else {
                        Button(action: {
                            isPickerPresented.toggle()
                        }) {
                            Text("Upload Photos")
                                .frame(width: 200, height: 200)
                                .frame(maxWidth: .infinity)
                                .background(Color.gray.opacity(0.5))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        .padding(.horizontal)
                    }
                }
                .sheet(isPresented: $isPickerPresented) {
                    ImagePicker(selectedImages: $selectedImages)
                }
                
                VStack(alignment: .leading) {
                    Text("Notes")
                        .font(.title3)
                        .fontWeight(.black)
                        .foregroundStyle(.primary)
                    
                    TextEditor(text: $notes)
                        .frame(height: 200)
                        .background(RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.black, lineWidth: 1))
                        .cornerRadius(10)
                        .shadow(radius: 5)
                }
                .padding()
                
                Button(action: {
                    if(notes != "" && !selectedImages.isEmpty) {
                        jvm.saveJournal(notes: notes, images: selectedImages)
                        dismissSheet()
                    } else {
                        showAlert = true
                    }
                }
                ) {
                    Text("Save Journal")
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(.primary)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                .buttonStyle(.plain)
                    
            }
            .alert(isPresented: $showAlert, content: {
                Alert(title: Text("OOPs 😬"), message: Text("Please upload atleast 1 image and add a note"))
            })
            .navigationTitle("New Journal")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    NavigationStack {
        NewJournalEntryView()
            .environmentObject(JournalViewModel())
    }
}
