//
//  TableViewCellSearch.swift
//  Deafy
//
//  Created by Yakup on 10.12.2022.
//

import UIKit

class TableViewCellSearch: UITableViewCell {

    @IBOutlet weak var searchMusicArtist: UILabel!
    @IBOutlet weak var searchMusicName: UILabel!
    @IBOutlet weak var searchImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
