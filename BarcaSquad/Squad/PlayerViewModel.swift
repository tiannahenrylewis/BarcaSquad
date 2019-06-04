//
//  PlayerViewModel.swift
//  BarcaSquad
//
//  Created by Tianna Henry-Lewis on 2019-05-30.
//  Copyright © 2019 Tianna Henry-Lewis. All rights reserved.
//

import Foundation

struct PlayerViewModel {
    let name: String
    let playerImageURL: URL?
    let position: String

    init(name: String, playerImageURL: URL?, position: String) {
        self.name = name
        self.playerImageURL = playerImageURL
        self.position = position
    }
}

extension PlayerViewModel {
    init(player: FCBarcelonaAPI.Players) {
        self.init(
            name: player.fullName,
            playerImageURL: URL(string: player.imageURL),
            position: player.position)
    }
}
