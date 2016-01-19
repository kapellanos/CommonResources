//
//  IDPickerArrayDataSource.swift
//  idealista
//
//  Created by Javier Aznar de los Rios on 11/6/15.
//
//

import UIKit

@objc class IDPickerArrayDataSource: NSObject
{
    typealias PickerBlock = (AnyObject) -> String
    
    weak var delegate: IDPickerArrayDataSourceDelegate?
    
    let items: [[AnyObject]]
    let pickerBlock: PickerBlock
    private let fontSize: Float
    
    init(delegate: IDPickerArrayDataSourceDelegate?, items: [[AnyObject]], pickerBlock: PickerBlock, fontSize: Float = 16.0)
    {
        self.items = items
        self.pickerBlock = pickerBlock
        self.fontSize = fontSize
        self.delegate = delegate
        
        super.init()
    }
    
    // MARK: - Public
    
    func obtainItemForRow(row: Int, inComponent component: Int) -> AnyObject?
    {
        if component >= items.count { return nil }
        if row >= items[component].count { return nil }
        
        return items[component][row]
    }
}

extension IDPickerArrayDataSource: UIPickerViewDataSource
{
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int
    {
        return items.count
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return items[component].count
    }
}

extension IDPickerArrayDataSource: UIPickerViewDelegate
{
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView
    {
        var labelView = view as? UILabel
        if labelView == nil {
            labelView = UILabel()
            labelView?.font = UIFont.systemFontOfSize(CGFloat(fontSize))
            labelView?.textAlignment = NSTextAlignment.Center
            labelView?.lineBreakMode = NSLineBreakMode.ByTruncatingMiddle
        }
        labelView?.text = pickerBlock(items[component][row])
        return labelView!
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        let item: AnyObject = items[component][row]
        delegate?.pickerArrayDataSourceDidSelectItem(self, item: item, component: component)
    }
}
