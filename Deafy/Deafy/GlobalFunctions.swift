//
//  globalFunctions.swift
//  Deafy
//
//  Created by Yakup on 8.12.2022.
//

import Foundation
import UIKit
import AVFoundation

var player: AVAudioPlayer?

var musicListTR = [Music]()
var musicListEN = [Music]()
var likedMusics = [Music]()
var allMusics = [Music]()

var music1 = Music(musicName: "Hard Sometimes", musicArtist: "Ruel", musicImage: UIImage(named: "ruel_hard_sometimes")!, musicFileName: "ruel_hard_sometimes", musicGroupIndex: 0, musicAllIndex: 0)
var music2 = Music(musicName: "Break My Heart Again", musicArtist: "Finneas", musicImage: UIImage(named: "finneas_break_my_heart_again")!, musicFileName: "finneas_break_my_heart_again", musicGroupIndex: 1, musicAllIndex: 1)
var music3 = Music(musicName: "I Lost A Friend", musicArtist: "Finneas", musicImage: UIImage(named: "finneas_i_lost_a_friend")!, musicFileName: "finneas_i_lost_a_friend", musicGroupIndex: 2, musicAllIndex: 2)
var music4 = Music(musicName: "More Than You Know", musicArtist: "Axwell", musicImage: UIImage(named: "axwell_more_than_you_know")!, musicFileName: "axwell_more_than_you_know", musicGroupIndex: 3, musicAllIndex: 3)
var music5 = Music(musicName: "Ne Güzel Güldün", musicArtist: "Pinhani", musicImage: UIImage(named: "pinhani_ne_guzel_guldun")!, musicFileName: "pinhani_ne_guzel_guldun", musicGroupIndex: 0, musicAllIndex: 4)
var music6 = Music(musicName: "Bi Tek Ben Anlarım", musicArtist: "KÖFN", musicImage: UIImage(named: "kofn_bi_tek_ben_anlarim")!, musicFileName: "kofn_bi_tek_ben_anlarim", musicGroupIndex: 1, musicAllIndex: 5)
var music7 = Music(musicName: "Çocuğum Belki", musicArtist: "Emre Aydın", musicImage: UIImage(named: "emre_aydin_cocugum_belki")!, musicFileName: "emre_aydin_cocugum_belki", musicGroupIndex: 2, musicAllIndex: 6)
var music8 = Music(musicName: "Nerdesin", musicArtist: "Ezhel", musicImage: UIImage(named: "ezhel_nerdesin")!, musicFileName: "ezhel_nerdesin", musicGroupIndex: 3, musicAllIndex: 7)

extension UIViewController{
    func UIColorFromRGB(_ rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    func setGradientBackground(topColor: UInt, bottomColor: UInt) {
        let colorTop =  UIColorFromRGB(topColor).cgColor
        let colorBottom = UIColorFromRGB(bottomColor).cgColor
                        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
                    
        self.view.layer.insertSublayer(gradientLayer, at:0)
    }
    
    func musicPlay(soundName:String, soundType:String) {
        guard let url = Bundle.main.url(forResource: soundName, withExtension: soundType) else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            guard let player = player else { return }
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func musicStop()
    {
        player?.stop()
    }
    func musicContinue()
    {
        player?.play()
    }
}
