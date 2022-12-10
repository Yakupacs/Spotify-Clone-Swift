//
//  ViewControllerPlayMusic.swift
//  Deafy
//
//  Created by Yakup on 8.12.2022.
//

import UIKit

class ViewControllerPlayMusic: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var replaceButton: UIButton!
    @IBOutlet weak var shuffleButton: UIButton!
    @IBOutlet weak var musicName: UILabel!
    @IBOutlet weak var musicImage: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var musicArtist: UILabel!
    @IBOutlet weak var sliderMusic: UISlider!
    
    var sign = 0
    var music = Music()
    var shuffleSign = 0
    var replaceSign = 0
    var musicTimer = Timer()
    
    var time = String()
    var dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playMusic(Any.self)
        changeSources()
        
        sliderMusic.addTarget(self, action: #selector(valueChanged), for: .valueChanged)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if likedMusics.contains(where: { ($0 == music) }) {
            likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }
        else{
            likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        musicTimer.invalidate()
    }
    
    @IBAction func playMusic(_ sender: Any) {
        if sign == 0{
            musicTimer.invalidate()
            
            musicPlay(soundName: music.musicFileName, soundType: "mp3")
            playButton.setImage(UIImage(named: "stop"), for: .normal)
            statusLabel.text = "Çalıyor"
            sign = 1
            
            sliderMusic.maximumValue = Float(player!.duration)
            musicTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateSlider), userInfo: nil, repeats: true)
        }
        else if sign == 2{
            musicTimer.invalidate()
            
            musicContinue()
            playButton.setImage(UIImage(named: "stop"), for: .normal)
            statusLabel.text = "Çalıyor"
            sign = 1
            
            sliderMusic.maximumValue = Float(player!.duration)
            musicTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateSlider), userInfo: nil, repeats: true)
        }
        else{
            musicTimer.invalidate()
            
            playButton.setImage(UIImage(named: "play-button"), for: .normal)
            statusLabel.text = "Durdur"
            musicStop()
            sign = 2
        }
    }
    @IBAction func rightFunc(_ sender: Any) {
        if shuffleSign == 0{
            if (replaceSign == 0){
                sign = 0
                
                var index = music.musicGroupIndex
                index += 1
                index %= musicListTR.last!.musicGroupIndex + 1
                music = musicListTR[index]
                
                changeSources()
                playMusic(Any.self)
            }
            else{
                sign = 0
                changeSources()
                playMusic(Any.self)
            }
        }
        else{
            if (replaceSign == 0)
            {
                sign = 0
                music = musicListTR.randomElement()!
                changeSources()
                playMusic(Any.self)
            }
            else{
                sign = 0
                changeSources()
                playMusic(Any.self)
            }
        }
    }
    @IBAction func shuffleFunc(_ sender: Any) {
        if shuffleSign == 0{
            shuffleButton.setImage(UIImage(named: "shuffle_green"), for: .normal)
            shuffleSign = 1
        }
        else{
            shuffleButton.setImage(UIImage(named: "shuffle"), for: .normal)
            shuffleSign = 0
        }
    }
    
    @IBAction func leftFunc(_ sender: Any) {
        if Double(player!.currentTime) < 3{
            sign = 0
            
            var index = music.musicGroupIndex
            if index == 0{
                index = musicListTR.last!.musicGroupIndex
            }
            else{
                index -= 1
            }
            music = musicListTR[index]
            
            changeSources()
            playMusic(Any.self)
        }
        else{
            sign = 0
            playMusic(Any.self)
        }
    }
    
    @IBAction func replaceFunc(_ sender: Any) {
        if replaceSign == 0{
            replaceButton.setImage(UIImage(named: "replace_green"), for: .normal)
            replaceSign = 1
        }
        else{
            replaceButton.setImage(UIImage(named: "replace"), for: .normal)
            replaceSign = 0
        }
    }
    
    @objc func updateSlider(){
        sliderMusic.value = Float(player!.currentTime)
        
        let (_,m,s) = secondsToHoursMinutesSeconds(Int(player!.currentTime))
        timeLabel.text = "\(m):\(s)"
        
        if (sliderMusic.value == Float(player!.currentTime)){
            rightFunc(Any.self)
        }
    }
    
    @objc func valueChanged(){
        musicTimer.invalidate()
        player?.stop()
        player?.currentTime = TimeInterval(sliderMusic.value)
        player?.play()
        musicTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateSlider), userInfo: nil, repeats: true)
    }
    
    func secondsToHoursMinutesSeconds(_ seconds: Int) -> (Int, Int, Int) {
        return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
    }
    @IBAction func likeFunc(_ sender: Any) {
        if likedMusics.contains(where: { ($0 == music) }) {
            if let index = likedMusics.firstIndex(of: music) {
                likedMusics.remove(at: index)
            }
            likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
        }
        else{
            likedMusics.append(music)
            likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }
    }
    
    func changeSources(){
        musicImage.image = music.musicImage
        musicName.text = music.musicName
        musicArtist.text = music.musicArtist
    }
}
