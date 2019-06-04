//
//  SquadViewController.swift
//  BarcaSquad
//
//  Created by Tianna Henry-Lewis on 2019-05-30.
//  Copyright © 2019 Tianna Henry-Lewis. All rights reserved.
//

import UIKit

class SquadViewController: UITableViewController {

    private var squadList : [PlayerViewModel] = []

    private let FCBarcelonaClient = FCBarcelonaAPI()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadPlayers()
    }


    private func loadPlayers() {
        FCBarcelonaClient.fetchPlayerList { result in
            switch result{
            case .success(let response):
                self.squadList = response.players.map(PlayerViewModel.init)
                print("loadPlayers: \(self.squadList)")
                self.tableView.reloadData()
            case .failure(let error):
                print("Error loading player list: \(error.localizedDescription)")
            }
        }
    }


    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return squadList.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell : PlayerCell = tableView.dequeue(for: indexPath)
        let result = squadList[indexPath.row]
        cell.configure(with: result)
        return cell
    }



}
