//
//  ListTableViewCell.swift
//  PopularArticles
//
//  Created by Raj Maurya on 01/03/20.
//  Copyright © 2020 Raj Maurya. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var describLbl: UILabel!
    @IBOutlet weak var writenByLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var sourceByLbl: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    var articalData:ArticlesData?{
        didSet{
            titleLbl.text =  articalData?.title
            describLbl.text =  articalData?.abstract
            writenByLbl.text =  articalData?.byline
            sourceByLbl.text =  articalData?.source
            timeLbl.text =  articalData?.published_date
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
