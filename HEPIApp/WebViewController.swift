//
//  WebViewController.swift
//  HEPIApp
//
//  Created by Kevin Bonga on 05.05.21.
//  Copyright © 2021 Kevin Bonga. All rights reserved.
//

import UIKit
import WebKit
//var url_webView = url

class WebViewController: UIViewController {
    var url_webView = url

    @IBOutlet var webView: WKWebView!//UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        displayURL()
        //webView.loadRequest(URLRequest(url: url_webView!))
        // Do any additional setup after loading the view.
    }
    
    func displayURL(){
        let myURLString = url_webView
        let myURL = NSURL(string: myURLString)
        let myURLRequest = NSURLRequest(url: myURL! as URL)
        webView.load(myURLRequest as URLRequest)
    }
    
    @IBAction func undwindToHome(){
        dismiss(animated: true, completion: nil)
        //let vc = storyboard?.instantiateViewController(withIdentifier:"mainAct_vc") as! MainActivity
        //present(vc, animated: true)
    }
    
    /*@IBAction func homeBtn(){
        let vc = storyboard?.instantiateViewController(withIdentifier:"mainAct_vc") as! MainActivity
        present(vc, animated: true)
    }*/

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
