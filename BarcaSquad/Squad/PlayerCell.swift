//
//  PlayerCell.swift
//  BarcaSquad
//
//  Created by Tianna Henry-Lewis on 2019-05-30.
//  Copyright © 2019 Tianna Henry-Lewis. All rights reserved.
//

import UIKit
import Kingfisher

class PlayerCell : UITableViewCell {
    @IBOutlet weak var playerNameLabel : UILabel!
    @IBOutlet weak var playerPositionLabel : UILabel!
    @IBOutlet weak var playerImageView : UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()

        backgroundView = UIView()

        //playerImageView Customizations
        //playerImageView.backgroundColor = Theme.Colours.blue
        playerImageView.layer.cornerRadius = 10
        playerImageView.layer.masksToBounds = true

        //Add additional colour customizations
    }

    func configure(with player: PlayerViewModel) {
        //File path to get to the cache for this application - can be deleted to clear cache
        //print(ImageCache.default.cachePath(forKey: "foo"))

        playerNameLabel.text = player.name
        playerPositionLabel.text = player.position

        // TODO: Handle Player Image configuration
        if let url = player.playerImageURL {
            let options : KingfisherOptionsInfo = [
                .transition(.fade(0.2))
            ]
            playerImageView.kf.setImage(with: url, options: options)
        }
    }


    override func prepareForReuse() {
        super.prepareForReuse()

        //reset values
        playerNameLabel.text = nil
        playerPositionLabel.text = nil

        playerImageView.kf .cancelDownloadTask()
        playerImageView.image = nil
    }

}
