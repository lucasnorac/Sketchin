//
//  ViewController.swift
//  Sketchin
//
//  Created by Lucas Caron Albarello on 28/12/2017.
//  Copyright © 2017 Lucas Caron Albarello. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var drawView : DrawView!
    
    @IBAction func red(_ sender: UIButton) {
        drawView.lineColor = UIColor.red.cgColor
    }
    
    
    @IBAction func blue(_ sender: UIButton) {
        drawView.lineColor = UIColor.blue.cgColor
    }
    
    @IBAction func green(_ sender: UIButton) {
        drawView.lineColor = UIColor.green.cgColor
    }
    
    @IBAction func excluir(_ sender: UIButton) {
        drawView.excluir()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

