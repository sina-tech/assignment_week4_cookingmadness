//
//  gameStartViewController.swift
//  assignment_week4_cookingmadness
//
//  Created by 황신아 on 2023/01/13.
//

import UIKit

class gameStartViewController: UIViewController {

    @IBOutlet var goalView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
        
        goalView.addGestureRecognizer(tapGesture)
                                  
                                                
    }
    
    // 화면 터치시 팝업 dismiss
    @objc func handleTap(sender: UITapGestureRecognizer) {
        self.dismiss(animated: false,
                     completion: nil)}
                                                
                                                
}
