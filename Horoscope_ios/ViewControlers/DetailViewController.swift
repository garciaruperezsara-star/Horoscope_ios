//
//  DetailViewController.swift
//  Horoscope_ios
//
//  Created by Mananas on 7/11/25.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageDetailView: UIImageView!
    @IBOutlet weak var dateDetailText: UILabel!
    @IBOutlet weak var selectorButton: UISegmentedControl!
    @IBOutlet weak var detailText: UITextView!
    var isToday: String = "TODAY"
    var horoscope:Horoscope!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.title = horoscope.name
        imageDetailView.image = horoscope.getSignIcon()
        dateDetailText.text = horoscope.date
        getPprediction(period: "daily")
        selectorButton.selectedSegmentIndex = 1
    }
    
    @IBAction func selectorChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0: isToday = "YESTERDAY"; getPprediction(period: "daily")
        case 1: getPprediction(period: "daily")
        case 2: isToday = "TOMORROW"; getPprediction(period: "daily")
        case 3: getPprediction(period: "weekly")
        case 4: getPprediction(period: "monthly")
        default:getPprediction(period: "daily")
        }
    }
    
    
    func getPprediction(period: String){
        let url = URL(string:"https://horoscope-app-api.vercel.app/api/v1/get-horoscope/\(period)?sign=\(horoscope.name)&day=\(isToday)")
        Task{
            do {
                let (data, _) = try await URLSession.shared.data(from: url!)
                    
                let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                    
                 let jsonData  = jsonObject["data"] as! [String: String]
                    let result = jsonData["horoscope_data"]
                
                    DispatchQueue.main.async {
                    self.detailText.text = result
                        if self.isToday != "TODAY"{self.isToday = "TODAY"}
                }
            }catch{
                print(error)
            }
        }
        
       
    }

}
