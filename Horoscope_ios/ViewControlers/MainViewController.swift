//
//  ViewController.swift
//  Horoscope_ios
//
//  Created by Mananas on 6/11/25.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var horoscopeList: [Horoscope] = Horoscope.getAll()
    
    override func viewDidLoad() {
        
        tableView.dataSource = self
        
        let searchControler = UISearchController(searchResultsController: nil)
        searchControler.searchBar.delegate = self
        navigationItem.searchController = searchControler
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
    }
 
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return horoscopeList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HoroscopeCell", for: indexPath) as! HoroscopeViewCellTableViewCell
        let horoscope = horoscopeList[indexPath.row]
        cell.render(horoscope: horoscope)
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            horoscopeList = Horoscope.getAll()
        }
        else{
            horoscopeList = Horoscope.getAll().filter{$0.name.range(of:  searchText, options: .caseInsensitive) != nil}
        }
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       let detailView = segue.destination as! DetailViewController
        let indexPath = tableView.indexPathForSelectedRow!
        let horoscope = horoscopeList[indexPath.row]
        detailView.horoscope = horoscope
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
