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
    @IBOutlet weak var favMenu: UIBarButtonItem!
    @IBOutlet weak var shareButton: UIBarButtonItem!
    
    var isToday: String = "TODAY"
    var isFavorite: Bool = false
    var horoscope:Horoscope!
    var prediction : String? = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.title = horoscope.name
        imageDetailView.image = horoscope.getSignIcon()
        dateDetailText.text = horoscope.date
        getPprediction(period: "daily")
        selectorButton.selectedSegmentIndex = 1
        
        
        let defaults = UserDefaults.standard
      isFavorite = (defaults.string(forKey: "FAVOURITE") ?? "") == horoscope.id
        setFavImage()}
    
   
    
    
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
    
    
    @IBAction func setFavorite(_ sender: UIBarButtonItem) {
        let defaults = UserDefaults.standard
        if isFavorite {isFavorite=false
            defaults.set("", forKey: "FAVOURITE")
            setFavImage()
        }
        else{isFavorite=true
            defaults.set(horoscope.id, forKey: "FAVOURITE")
            setFavImage()
        }
    }
    
    func setFavImage(){
        if isFavorite==true{
            favMenu.image = UIImage(systemName: "heart.fill")
        }
        else{
            favMenu.image = UIImage(systemName: "heart")
            }
    }
    
    func getPprediction(period: String){
        let url = URL(string:"https://horoscope-app-api.vercel.app/api/v1/get-horoscope/\(period)?sign=\(horoscope.name)&day=\(isToday)")
        Task{
            do {
                let (data, _) = try await URLSession.shared.data(from: url!)
                    
                let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                    
                 let jsonData  = jsonObject["data"] as! [String: String]
                    prediction = jsonData["horoscope_data"]
                
                    DispatchQueue.main.async {
                        self.detailText.text = self.prediction
                        if self.isToday != "TODAY"{self.isToday = "TODAY"}
                }
            }catch{
                print(error)
            }
        }
        
       
    }
    @IBAction func shareComand(_ sender: Any) {
        if let text = prediction{
            let textToShare = [ text ]
            let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
            
            activityViewController.popoverPresentationController?.sourceView = self.view
            
            self.present(activityViewController, animated: true, completion: nil)
        }
        
    }

}
