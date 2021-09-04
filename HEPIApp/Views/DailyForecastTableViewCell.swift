//
//  DailyForecastTableViewCell.swift
//  HEPIApp
//
//  Created by Kevin Bonga on 29.05.21.
//  Copyright © 2021 Kevin Bonga. All rights reserved.
//

import UIKit

class DailyForecastTableViewCell: UITableViewCell {

    @IBOutlet var dayLabel: UILabel!
    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var forecastImgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
