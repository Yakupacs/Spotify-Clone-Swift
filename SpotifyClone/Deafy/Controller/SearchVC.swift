//
//  ViewControllerSearch.swift
//  Deafy
//
//  Created by Yakup on 10.12.2022.
//

import UIKit

class SearchVC: UIViewController, UITableViewDelegate,  UITableViewDataSource, UISearchBarDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var filteredMusic = [Music]()
    var musicSelected = Music()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        
        let textFieldInsideSearchBar = searchBar.value(forKey: "searchField") as? UITextField

        textFieldInsideSearchBar?.textColor = .white
        searchBar.searchTextField.leftView?.tintColor = .white
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredMusic.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellSearch", for: indexPath) as! TableViewCellSearch
        cell.searchImage.image = filteredMusic[indexPath.row].musicImage
        cell.searchMusicName.text = filteredMusic[indexPath.row].musicName
        cell.searchMusicArtist.text = filteredMusic[indexPath.row].musicArtist
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        musicSelected = filteredMusic[indexPath.row]
        performSegue(withIdentifier: "toPlayMusic", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPlayMusic"{
            let destVC = segue.destination as! PlayingVC
            destVC.music = musicSelected
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredMusic = []
        
        if searchText == ""{
            filteredMusic = allMusics
        }
        
        for music in allMusics
        {
            if music.musicName.uppercased().contains(searchText.uppercased()){
                filteredMusic.append(music)
            }
        }
        
        tableView.reloadData()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
