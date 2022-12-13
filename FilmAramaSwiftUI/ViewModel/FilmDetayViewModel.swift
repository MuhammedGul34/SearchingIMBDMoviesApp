//
//  FilmDetayViewModel.swift
//  FilmAramaSwiftUI
//
//  Created by Muhammed Gül on 31.10.2022.
//

import Foundation
import SwiftUI

class FilmDetayViewModel : ObservableObject {
    @Published var filmDetayi : FilmDetaylariViewModel?
    
let downloaderClient = DownloaderClient()
    
    func filmDetayiAl(imdbId: String) {
        downloaderClient.filmdetayiniIndir(imdbId: imdbId) { (sonuc) in
            switch sonuc {
            case.failure(let hata):
                print(hata)
            
            case.success(let filmDetay):
                self.filmDetayi = FilmDetaylariViewModel(detay: filmDetay)
            }
        }
    }
}

struct FilmDetaylariViewModel {
    let detay : FilmDetay
    var title : String {
        detay.Title
    }
    
    var poster : String {
        detay.poster
    }
    
    var year : String {
        detay.year
    }
    
    var imdbId : String {
        detay.imdbId
    }
    
    var direcotr : String {
        detay.director
    }
    
    var writer : String {
        detay.writer
    }
    
    var awards : String {
        detay.awards
    }
    
    var plot : String {
        detay.plot
    }
}
