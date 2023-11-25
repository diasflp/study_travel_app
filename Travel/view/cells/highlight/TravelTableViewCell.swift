//
//  TravelTableViewCell.swift
//  Travel
//
//  Created by Felipe Dias on 25/11/23.
//

import UIKit

class TravelTableViewCell: UITableViewCell {

    
    @IBOutlet weak var backgroundViewCell: UIView!
    @IBOutlet weak var travelImage: UIImageView!
    @IBOutlet weak var travelTitleLabel: UILabel!
    @IBOutlet weak var travelSubtitleLabel: UILabel!
    @IBOutlet weak var travelDailyLabel: UILabel!
    @IBOutlet weak var travelPriceWithoutDiscountLabel: UILabel!
    @IBOutlet weak var travelPriceLabel: UILabel!
    @IBOutlet weak var travelCancellationLabel: UILabel!
    
    func configCell(_ travel: Travel?) {
        travelImage.image = UIImage(named: travel?.asset ?? "")
        travelTitleLabel.text = travel?.title
        travelSubtitleLabel.text = travel?.subtitle
        travelPriceLabel.text = "R$ \(travel?.price ?? 0)"
        travelCancellationLabel.text = travel?.cancellation
        
        let atributeString: NSMutableAttributedString = (
            NSMutableAttributedString(string: "R$ \(travel?.priceWithoutDiscount ?? 0)")
        )
        
        atributeString.addAttribute(
            NSAttributedString.Key.strikethroughStyle,
            value: 1,
            range: NSMakeRange(0, atributeString.length)
        )
        
        travelPriceWithoutDiscountLabel.attributedText = atributeString
        
        if let numberDaily = travel?.daily, let numberGuests = travel?.guests {
            let daily = numberDaily == 1 ? "Diária" : "Diárias"
            let guest = numberGuests == 1 ? "Pessoa" : "Pessoas"
            
            travelDailyLabel.text = "\(numberDaily) \(daily) - \(numberGuests) \(guest)"
        }
        
        DispatchQueue.main.async {
            self.backgroundViewCell.addShadow()
        }
    }
}
