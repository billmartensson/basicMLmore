//
//  ContentView.swift
//  basicML
//
//  Created by BillU on 2023-09-18.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
    
    @StateObject var domodel = DoModel()
    
    @State private var selectedPhoto: PhotosPickerItem?
    
    @State private var image: Image?
    
    var body: some View {
        VStack {
            Text(domodel.resultText)
            
            image?
                                .resizable()
                                .scaledToFit()
            
            PhotosPicker(selection: $selectedPhoto) {
                                Text("Välj bild")
                            }
        }
        .padding()
        .task(id: selectedPhoto) {
                        image = try? await selectedPhoto?.loadTransferable(type: Image.self)
            
            if image != nil {
                domodel.doImage(theimageIn: image!)

            }

        }
        .onAppear() {
        }
    }
    
    
    
    
    
}

#Preview {
    ContentView()
}
