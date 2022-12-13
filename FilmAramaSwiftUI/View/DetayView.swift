//
//  DetayView.swift
//  FilmAramaSwiftUI
//
//  Created by Muhammed Gül on 31.10.2022.
//

import SwiftUI

struct DetayView: View {
    let imdbId : String
    
    @ObservedObject var filmDetayViewModel = FilmDetayViewModel()
    var body: some View {
        VStack{
            OzelImage(url: filmDetayViewModel.filmDetayi?.poster ?? "").frame(width: UIScreen.main.bounds.width * 0.6, height: UIScreen.main.bounds.height * 0.3, alignment: .center)
            
            Text(filmDetayViewModel.filmDetayi?.title ?? "Film ismi gösterilecek").font(.title).padding()
            
            
            
            Text(filmDetayViewModel.filmDetayi?.plot ?? "Film Plotu Gösterilecek")
        }.onAppear {
            self.filmDetayViewModel
                .filmDetayiAl(imdbId: imdbId)
        }
    }
}

struct DetayView_Previews: PreviewProvider {
    static var previews: some View {
        DetayView(imdbId: "test")
    }
}
