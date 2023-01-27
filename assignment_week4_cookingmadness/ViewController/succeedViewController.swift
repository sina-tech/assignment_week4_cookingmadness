//
//  succeedViewController.swift
//  assignment_week4_cookingmadness
//
//  Created by 황신아 on 2023/01/13.
//

import UIKit

class succeedViewController: UIViewController {

    @IBAction func reply(_ sender: Any) {
        
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let replayVC = storyBoard.instantiateViewController(withIdentifier: "ViewController")
        replayVC.modalPresentationStyle = .overCurrentContext
        
        self.present(replayVC, animated: true, completion: nil)
    }
    
    @IBAction func out(_ sender: Any) {
        UIApplication.shared.perform(#selector(NSXPCConnection.suspend))
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            exit(0)
        }
        
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
