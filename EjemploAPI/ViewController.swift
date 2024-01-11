//
//  ViewController.swift
//  EjemploAPI
//
//  Created by Anna Ruiz on 11/01/2024.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        cargando.hidesWhenStopped = true
        cargando.stopAnimating()
        
    }
    

    @IBOutlet weak var lbResultadoPost: UILabel!
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var txtIdUser: UITextField!
    @IBOutlet weak var lbResultadoListafotos: UILabel!
   
    @IBOutlet weak var txtIdFotos: UITextField!
    

    @IBOutlet weak var cargando: UIActivityIndicatorView!
    @IBOutlet weak var lbResultadoListaAlbum: UILabel!
    
    
    @IBAction func btnGetListaAlbums(_ sender: Any) {
        
        cargando.startAnimating()
        
        ApiConexiones.api.getAlbums(){
            //Que queremos q haga si todo va bien
            respuesta in
            
            self.lbResultadoListaAlbum.text = "Elementos: \(respuesta.count)"
            self.cargando.stopAnimating()
        }failure: {
            //Si va mal
            error in
            self.lbResultadoListaAlbum.text = error.debugDescription
            self.cargando.stopAnimating()
        
        }
    }
    
    @IBAction func btnGetPhotosAlbum(_ sender: Any) {
        cargando.startAnimating()
        let id: Int = Int(txtIdFotos.text!)!
        
        ApiConexiones.api.getPhotos2(idAlbum: id){
            respuesta in
            self.lbResultadoListafotos.text = "Fotos: \(respuesta.count)"
            self.cargando.stopAnimating()
        } failure: {
            error in
            self.lbResultadoListafotos.text = error.debugDescription
            self.cargando.stopAnimating()
        }
    }
    

    @IBAction func btnCrearAlbum(_ sender: Any) {
        cargando.startAnimating()
        let album: NuevoAlbum = NuevoAlbum(userID: Int(txtIdUser.text!)!, tittle: txtTitle.text!)
        
        ApiConexiones.api.addAlbum(album: album){
            respuesta in
            self.cargando.stopAnimating()
            self.lbResultadoPost.text = "ID creado: \(respuesta.id)"
            
        } failure: {
            error in
            self.cargando.stopAnimating()
            self.lbResultadoPost.text = error.debugDescription
        }
    }
}

