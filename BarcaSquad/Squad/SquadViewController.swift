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
        PlayerViewModel(name: "Luis Suarez", imageURL: URL(string: "https://fcbarcelona-static-files.s3.amazonaws.com/fcbarcelona/photo/2018/10/09/3a2bc952-a7d1-48d8-ab5d-272d3ff6ed17/Suarez-Hero-2018-19.png"), position: "Forward"),
        PlayerViewModel(name: "Jasper Cillessen", imageURL: URL(string: "https://fcbarcelona-static-files.s3.amazonaws.com/fcbarcelona/photo/2018/10/09/04142603-daf1-4b3b-a834-13b7a731aac1/p72162.png"), position: "Goalkeeper"),
        PlayerViewModel(name: "Thomas Vermaelen", imageURL: nil, position: "Defender"),
        PlayerViewModel(name: "Marc-Andre ter Stegen", imageURL: nil, position: "Goalkeeper"),
        PlayerViewModel(name: "Kevin-Prince Boateng", imageURL: URL(string: "https://fcbarcelona-static-files.s3.amazonaws.com/fcbarcelona/photo/2019/02/04/e205e642-bf16-4419-9082-5d1087f1e7c7/Boateng.png"), position: "Forward"),
        PlayerViewModel(name: "Inaki Pena Sotorres", imageURL: nil, position: "Goalkeeper"),
        PlayerViewModel(name: "Sergi Roberto", imageURL: URL(string: "https://fcbarcelona-static-files.s3.amazonaws.com/fcbarcelona/photo/2018/10/09/aa86758a-73a8-48b4-b45f-445854950866/Sergi-Roberto-Hero-2018-19.png"), position: "Defender")
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
