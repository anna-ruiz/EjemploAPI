//
//  ApiConexiones.swift
//  EjemploAPI
//
//  Created by Anna Ruiz on 11/01/2024.
//

import Foundation
import Alamofire //para las llamadas de la API

final class ApiConexiones{
    static let api = ApiConexiones()
    let BASE_URL="https://jsonplaceholder.typicode.com"
    let estadoOK = 200...299
    
    //GET todos los Albums      //Si va bien                            //Si va mal
    func getAlbums(success: @escaping (_ respuesta: ListaAlbums) -> (), failure: @escaping(_ error: Error?) -> ()){
        let url = "\(BASE_URL)/albums"
        
        AF.request(url, method: .get).validate(statusCode: estadoOK).responseDecodable(of: ListaAlbums.self){ respuesta in
            if let albums = respuesta.value
            {
                success(albums)
            }else{
                failure(respuesta.error)
            }
        }
        }
    
    
    //Get las fotos de un album en concreto x parametros
    func getPhotos(idAlbum: Int, success: @escaping (_ respuesta: ListaPhotos) -> (), failure: @escaping(_ error: Error?) -> () ){
        let url = "\(BASE_URL)/photos"
        let parametros: Parameters = ["albumId": idAlbum]
        
        AF.request(url, method: .get, parameters: parametros).validate(statusCode: estadoOK).responseDecodable(of: ListaPhotos.self){ respuesta in
            if let photos = respuesta.value
            {
                success(photos)
            }else{
                failure(respuesta.error)
            }
        }
    }
    
    //Get las fotos de un album por la URL/path
    func getPhotos2(idAlbum: Int, success: @escaping (_ respuesta: ListaPhotos) -> (), failure: @escaping(_ error: Error?) -> () ){
        let url = "\(BASE_URL)/albums/\(idAlbum)/photos"
        
        AF.request(url, method: .get).validate(statusCode: estadoOK).responseDecodable(of: ListaPhotos.self){ respuesta in
            if let photos = respuesta.value
            {
                success(photos)
            }else{
                failure(respuesta.error)
            }
        }
    }
    
    //Post enviar la info de un album
    func addAlbum(album: NuevoAlbum, success: @escaping (_ respuesta: Album) -> (), failure: @escaping (_ error: Error?) -> ()){
        let  url = "\(BASE_URL)/albums"
        
        AF.request(url, method: .post, parameters: album, encoder: JSONParameterEncoder.default).validate(statusCode: estadoOK).responseDecodable(of: Album.self){
            respuesta in
            if let album = respuesta.value{
                success(album)
            }else{
                failure(respuesta.error)
            }
        }
        
        
    }
    
    }
