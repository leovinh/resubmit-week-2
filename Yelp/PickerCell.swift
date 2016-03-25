//
//  PickerCell.swift
//  Yelp
//
//  Created by The Vinh Duong on 3/25/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit

enum PickerCellType : Int {
    case distance = 0
    case sortby = 1
}

@objc protocol PickerCellDelegate {
    optional func pickerCell(pickerCell: PickerCell, didSelectRow row: Int)
}

class PickerCell: UITableViewCell, UIPickerViewDelegate, UIPickerViewDataSource {

    weak var delegate: PickerCellDelegate?
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    var pickerData: [String] = []
    
    var cellType: PickerCellType = PickerCellType.distance
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        pickerView.dataSource = self
        pickerView.delegate = self
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        
        return pickerData.count
    }

    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        return pickerData[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        delegate?.pickerCell!(self, didSelectRow: row);
        
    }
}
