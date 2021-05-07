//
//  MainActivity.swift
//  HEPIApp
//
//  Created by Kevin Bonga on 04.05.21.
//  Copyright © 2021 Kevin Bonga. All rights reserved.
//

import UIKit


let portesOuvertes = "https://www.portesouvertes-hepia.ch/filiere/informatique_et_systemes_de_communication"
let geneISC = "https://www.generation-isc.ch/"
let hepiaISC = "https://www.hesge.ch/hepia/bachelor/informatique-et-systemes-communication"
let fichesModules  = "https://www.hesge.ch/hepia/sites/default/files//bachelor/documents/isc_modules_1ere_annee_2020_2021.pdf"
var url = ""//URL(string: "https://www.google.com")


class MainActivity: UIViewController {


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*let backgroundImage = UIImage.init(named: "HEPIApp_background.png")
        let backgroundImageView = UIImageView.init(frame: self.view.frame)
        
        backgroundImageView.image = backgroundImage
        backgroundImageView.contentMode = .scaleAspectFill
        
        self.view.insertSubview(backgroundImageView, at: 0)*/
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! WebViewController
        if segue.identifier == "FichesISC" {
            destinationVC.url_webView = fichesModules
            }//URL(string: fichesModules)}
        else if segue.identifier == "geneISC"{
            destinationVC.url_webView = geneISC} //URL(string: geneISC)}
        else if segue.identifier == "hepiaISC"{
            destinationVC.url_webView = hepiaISC} //URL(string: hepiaISC)}
        else if segue.identifier == "portesOuvertes"{
            destinationVC.url_webView = portesOuvertes //URL(string: portesOuvertes)
            destinationVC.view.backgroundColor = UIColor.red
        }
    }
    
    /*@IBAction func actionlistenerBtn(){
      //  if (HepiaBtn){
            url = URL(string: hepiaISC)
            let vc = storyboard?.instantiateViewController(withIdentifier:"web_vc") as! WebViewController
            present(vc, animated: true)
    }*/
      //  }
     //  else if
    /*@IBAction func actionlistenerBtnPO()
         {url = URL(string: portesOuvertes)
            let vc = storyboard?.instantiateViewController(withIdentifier:"web_vc") as! WebViewController
            present(vc, animated: true)
    }*/
    
      //   else if
    /*@IBAction func actionlistenerBtnGen()
         {url = URL(string: geneISC)
            let vc = storyboard?.instantiateViewController(withIdentifier:"web_vc") as! WebViewController
            present(vc, animated: true)
    }*/

        //  else if
   /* @IBAction func actionlistenerBtnFM()
            {url = URL(string: fichesModules)
                let vc = storyboard?.instantiateViewController(withIdentifier:"web_vc") as! WebViewController
                present(vc, animated: true)
    }*/


    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

