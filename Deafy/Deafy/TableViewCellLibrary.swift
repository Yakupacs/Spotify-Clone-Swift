//
//  TableViewCell.swift
//  Deafy
//
//  Created by Yakup on 9.12.2022.
//

import UIKit

class TableViewCellLibrary: UITableViewCell {

    @IBOutlet weak var cellLikeButton: UIButton!
    @IBOutlet weak var cellMusicArtistLabel: UILabel!
    @IBOutlet weak var cellMusicNameLabel: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
