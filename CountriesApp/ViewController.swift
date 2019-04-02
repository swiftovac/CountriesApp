//
//  ViewController.swift
//  CountriesApp
//
//  Created by Stefan Milenkovic on 3/31/19.
//  Copyright © 2019 Stefan Milenkovic. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var countries = [Country]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        title = "Countries"
        let url = Bundle.main.url(forResource: "data", withExtension: "json")
        
        if let jsonUrl = url {
            let jsonDecoder = JSONDecoder()
            if let data = try? Data(contentsOf: jsonUrl) {
                if let con = try? jsonDecoder.decode(Countries.self, from: data) {
                    countries = con.countries
                }
            }
        }
        }
    
        
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let country = countries[indexPath.row]
        
        cell.textLabel?.text = country.name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let country = countries[indexPath.row]
        if let vc = storyboard?.instantiateViewController(withIdentifier: "details") as? DetailsVC {
        
        vc.recivedCountry = country
        navigationController?.pushViewController(vc, animated: true)
        }
    }


}

