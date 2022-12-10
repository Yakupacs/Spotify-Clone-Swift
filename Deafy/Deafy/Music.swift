//
//  Music.swift
//  Deafy
//
//  Created by Yakup on 8.12.2022.
//

import Foundation
import UIKit

class Music: Equatable{
    static func == (lhs: Music, rhs: Music) -> Bool {
        return lhs.musicName == rhs.musicName && lhs.musicGroupIndex == lhs.musicGroupIndex
    }
    
    
    var musicName = String()
    var musicArtist = String()
    var musicImage = UIImage()
    var musicFileName = String()
    var musicGroupIndex = Int()
    var musicAllIndex = Int()
    
    init(musicName: String = String(), musicArtist: String = String(), musicImage: UIImage = UIImage(), musicFileName: String = String(), musicGroupIndex: Int = Int(), musicAllIndex: Int = Int()) {
        self.musicName = musicName
        self.musicArtist = musicArtist
        self.musicImage = musicImage
        self.musicFileName = musicFileName
        self.musicGroupIndex = musicGroupIndex
        self.musicAllIndex = musicAllIndex
    }
}
