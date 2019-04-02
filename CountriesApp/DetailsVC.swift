//
//  DetailsVC.swift
//  CountriesApp
//
//  Created by Stefan Milenkovic on 4/2/19.
//  Copyright © 2019 Stefan Milenkovic. All rights reserved.
//

import UIKit

class DetailsVC: UIViewController {
    
    var recivedCountry: Country?
    
    @IBOutlet weak var capitalLabel: UILabel!
    @IBOutlet weak var populationlabel: UILabel!
    @IBOutlet weak var areaLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        guard let country = recivedCountry else {
            return
        }
        
        title = country.name
        
        capitalLabel.text = "Capital: \(country.capital)"
        populationlabel.text = "Population: \(country.population)"
        areaLabel.text = "Area size: \(country.area) km2"
        currencyLabel.text = "Currency: \(country.currency)"
    }
    


}
