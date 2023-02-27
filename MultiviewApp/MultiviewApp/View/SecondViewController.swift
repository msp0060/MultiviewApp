//
//  SecondViewController.swift
//  MultiviewApp
//
//  Created by Shane Peek on 2/25/23.
//

import UIKit

class SecondViewController: UIViewController {

    var cityName = ""
    var stateName = ""
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var stateNameLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cityNameLabel.text = cityName
        stateNameLabel.text = stateName

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
