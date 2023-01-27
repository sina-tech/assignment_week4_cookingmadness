//
//  failViewController.swift
//  assignment_week4_cookingmadness
//
//  Created by 황신아 on 2023/01/13.
//

import UIKit

class failViewController: UIViewController {

    @IBAction func replyBtn(_ sender: Any) {
//        self.dismiss(animated: false,
//                     completion: nil)
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let popupreplayVC = storyBoard.instantiateViewController(withIdentifier: "ViewController")
        popupreplayVC.modalPresentationStyle = .overCurrentContext
        
        self.present(popupreplayVC, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
