//
//  ContentView.swift
//  FilmAramaSwiftUI
//
//  Created by Muhammed Gül on 28.10.2022.
//

import SwiftUI

struct FilmListeView: View {
   @ObservedObject var filmListeViewModel : FilmListeViewModel
    
    @State var aranacakFilm = ""
    
    init() {
        self.filmListeViewModel = FilmListeViewModel()
        
    }
    var body: some View {
        NavigationView{
            VStack {
                TextField("Aranacak Film", text: $aranacakFilm) {
                    self.filmListeViewModel.filmAramasiYap(filmIsmi: aranacakFilm.trimmingCharacters(in: .whitespacesAndNewlines).addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? aranacakFilm)
                        
                }.padding().textFieldStyle(RoundedBorderTextFieldStyle())
                
                List(filmListeViewModel.filmler, id: \.imdbId) { film in
                    NavigationLink(
                        destination: DetayView(imdbId: film.imdbId),
                        label: {
                        HStack(){
                            OzelImage(url: film.poster)
                            frame(width: 90, height: 130)
                            VStack(alignment: .leading)
                            {
                                Text(film.title)
                                    .font(.title3)
                                    .foregroundColor(.blue)
                                
                                Text(film.year)
                                    .foregroundColor(.orange)
                            }
                        }
                    })
                    }

                 
            }.navigationTitle(Text("Film Kitabı"))
        }
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FilmListeView()
    }
}
