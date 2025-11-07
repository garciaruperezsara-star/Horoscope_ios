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
    @IBOutlet weak var descriptionDetailText: UILabel!
    @IBOutlet weak var favItem: UIBarButtonItem!
    var horoscope:Horoscope!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.title = horoscope.name
        imageDetailView.image = horoscope.getSignIcon()
        dateDetailText.text = horoscope.date
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
