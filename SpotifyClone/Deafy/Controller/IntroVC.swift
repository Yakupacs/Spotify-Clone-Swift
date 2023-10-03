//
//  ViewController.swift
//  Deafy
//
//  Created by Yakup on 7.12.2022.
//

import UIKit

class IntroVC: UIViewController {

    var timer = Timer()
    var count = 3
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunc), userInfo: nil, repeats: true)
        
        musicListEN.append(music1)
        musicListEN.append(music2)
        musicListEN.append(music3)
        musicListEN.append(music4)
        musicListTR.append(music5)
        musicListTR.append(music6)
        musicListTR.append(music7)
        musicListTR.append(music8)
        allMusics.append(music1)
        allMusics.append(music2)
        allMusics.append(music3)
        allMusics.append(music4)
        allMusics.append(music5)
        allMusics.append(music6)
        allMusics.append(music7)
        allMusics.append(music8)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.imageView.alpha = 0
        UIView.animate(withDuration: 2, delay: 0.5) {
            self.imageView.alpha = 1
        }
    }
    
    @objc func timerFunc(){
        count -= 1
        if (count == 0){
            timer.invalidate()
            performSegue(withIdentifier: "toHomepage", sender: nil)
        }
    }
}

