//
//  SquadViewController.swift
//  BarcaSquad
//
//  Created by Tianna Henry-Lewis on 2019-05-30.
//  Copyright © 2019 Tianna Henry-Lewis. All rights reserved.
//

import UIKit

class SquadViewController: UITableViewController {

    private var players : [PlayerViewModel] = [
        PlayerViewModel(name: "Lionel Messi", imageURL: URL(string: "https://fcbarcelona-static-files.s3.amazonaws.com/fcbarcelona/photo/2018/10/09/608bb4da-06db-47b1-ac42-55707ec47a66/p19054.png"), position: "Forward"),
        PlayerViewModel(name: "Luis Suarez", imageURL: nil, position: "Forward"),
        PlayerViewModel(name: "Jasper Cillessen", imageURL: nil, position: "Goalkeeper"),
        PlayerViewModel(name: "Thomas Vermaelen", imageURL: nil, position: "Defender"),
        PlayerViewModel(name: "Marc-Andre ter Stegen", imageURL: nil, position: "Goalkeeper"),
        PlayerViewModel(name: "Kevin-Prince Boateng", imageURL: nil, position: "Forward"),
        PlayerViewModel(name: "Inaki Pena Sotorres", imageURL: nil, position: "Goalkeeper"),
        PlayerViewModel(name: "Sergi Roberto", imageURL: nil, position: "Defender")
    ]
    private var playerResults : [PlayerViewModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        playerResults = players
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return playerResults.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell : PlayerCell = tableView.dequeue(for: indexPath)
        let result = playerResults[indexPath.row]
        cell.configure(with: result)
        return cell
    }



}
