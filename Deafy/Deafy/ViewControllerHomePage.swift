//
//  ViewControllerHomePage.swift
//  Deafy
//
//  Created by Yakup on 8.12.2022.
//

import UIKit
import AVFoundation

class ViewControllerHomePage: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionViewEnglish: UICollectionView!
    @IBOutlet weak var collectionViewTurkish: UICollectionView!
    
    var musicSelected = Music()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionViewEnglish{
            return musicListEN.count
        }
        else{
            return musicListTR.count
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionViewTurkish{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellTurkish", for: indexPath) as! CollectionViewCellTurkish
            
            cell.musicImage.image = musicListTR[indexPath.row].musicImage
            cell.musicLabel.text = musicListTR[indexPath.row].musicName
            return cell
        }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellEnglish", for: indexPath) as! CollectionViewCellEnglish
            
            cell.musicImage.image = musicListEN[indexPath.row].musicImage
            cell.musicLabel.text = musicListEN[indexPath.row].musicName
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.collectionViewTurkish{
            musicSelected = musicListTR[indexPath.row]
            performSegue(withIdentifier: "toPlayMusic", sender: nil)
        }
        else{
            musicSelected = musicListEN[indexPath.row]
            performSegue(withIdentifier: "toPlayMusic", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPlayMusic"{
            let destVC = segue.destination as! ViewControllerPlayMusic
            destVC.music = musicSelected
        }
    }

}
