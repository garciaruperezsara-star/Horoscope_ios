//
//  HoroscopeViewCellTableViewCell.swift
//  Horoscope_ios
//
//  Created by Mananas on 6/11/25.
//

import UIKit

class HoroscopeViewCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var signImage: UIImageView!
    @IBOutlet weak var signText: UILabel!
    @IBOutlet weak var signDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func render(horoscope:Horoscope) {
        signImage.image = horoscope.getSignIcon()
        signText.text = horoscope.name
        signDate.text = horoscope.date
    }

}
