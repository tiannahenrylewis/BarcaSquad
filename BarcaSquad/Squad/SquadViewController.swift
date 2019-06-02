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
        PlayerViewModel(name: "Lionel Messi", playerImageURL: URL(string: "https://fcbarcelona-static-files.s3.amazonaws.com/fcbarcelona/photo/2018/10/09/608bb4da-06db-47b1-ac42-55707ec47a66/p19054.png"), position: "Forward"),
        PlayerViewModel(name: "Thomas Vermaelen", playerImageURL: URL(string: "https://fcbarcelona-static-files.s3.amazonaws.com/fcbarcelona/photo/2018/10/09/9ee30fcd-fff9-4396-97b9-6a6e832997d9/Vermaelen.png"), position: "Defender"),
        PlayerViewModel(name: "Sergi Roberto", playerImageURL: URL(string: "https://fcbarcelona-static-files.s3.amazonaws.com/fcbarcelona/photo/2018/10/09/5d93f8a7-f539-4111-9b0c-9ea03a01c875/Sergi-Roberto-Hero-2018-19.png"), position: "Defender"),
        PlayerViewModel(name: "Ousmane Dembele", playerImageURL: URL(string: "https://fcbarcelona-static-files.s3.amazonaws.com/fcbarcelona/photo/2018/10/09/7556f2e3-60cc-4909-afee-bbc3f2efa8e2/p219438.png"), position: "Forward")
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
