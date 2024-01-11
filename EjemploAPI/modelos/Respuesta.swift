//
//  Respuesta.swift
//  EjemploAPI
//
//  Created by Anna Ruiz on 11/01/2024.
//

import Foundation

struct Album: Decodable {
    let userId: Int
    let id: Int
    let title: String
}

typealias ListaAlbums = [Album] //creamos nuestro "tipo" que será realmente un tipo Array de Album


struct Photo: Decodable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}

typealias ListaPhotos = [Photo]


struct NuevoAlbum: Encodable{
    let userID: Int
    let tittle: String
}






