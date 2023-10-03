//
//  ViewControllerMusicLibrary.swift
//  Deafy
//
//  Created by Yakup on 9.12.2022.
//

import UIKit

class ViewControllerMusicLibrary: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var musicSelected = Music()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return likedMusics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCellLibrary
        cell.cellMusicNameLabel.text = likedMusics[indexPath.row].musicName
        cell.cellImage.image = likedMusics[indexPath.row].musicImage
        cell.cellMusicArtistLabel.text = likedMusics[indexPath.row].musicArtist
        cell.cellLikeButton.tag = indexPath.row
        cell.cellLikeButton.addTarget(self, action: #selector(removeLiked), for: .touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        musicSelected = likedMusics[indexPath.row]
        performSegue(withIdentifier: "toPlayMusic", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPlayMusic"{
            let destVC = segue.destination as! ViewControllerPlayMusic
            destVC.music = musicSelected
        }
    }
    
    @objc func removeLiked(sender: UIButton){
        likedMusics.remove(at: sender.tag)
        tableView.reloadData()
    }
}
