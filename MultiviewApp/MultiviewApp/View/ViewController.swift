//
//  ViewController.swift
//  MultiviewApp
//
//  Created by Shane Peek on 2/24/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var cities = [
        CityState("Auburn", "AL"),
        CityState("Atlanta", "GA"),
        CityState("Chicago", "IL"),
        CityState("New York", "NY"),
        CityState("Los Angeles", "CA"),
        CityState("Austin", "TX"),
        CityState("Tucson", "AZ")
    ]

    var cityName = ""
    var stateName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = cities[indexPath.row].city
        content.secondaryText = cities[indexPath.row].state
        cell.contentConfiguration = content
        return cell
    }

    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (_, _, _) in
            self.cities.remove(at: indexPath.row)
            tableView.reloadData()
        }

        let passAction = UIContextualAction(style: .normal, title: "Pass") { (_, _, _) in
            self.cityName = self.cities[indexPath.row].city
            self.stateName = self.cities[indexPath.row].state
            self.performSegue(withIdentifier: "toSecond", sender: self)
        }

        let config = UISwipeActionsConfiguration(actions: [deleteAction, passAction])
        config.performsFirstActionWithFullSwipe = false
        return config
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "toSecond" {
            let navigation = segue.destination as! SecondViewController
                navigation.cityName = cityName
                navigation.stateName = stateName
        }
    }

}

