//
//  IDPickerArrayDataSourceDelegate.swift
//  idealista
//
//  Created by Javier Aznar de los Rios on 11/6/15.
//
//

import Foundation

@objc protocol IDPickerArrayDataSourceDelegate: class
{
    func pickerArrayDataSourceDidSelectItem(sender: IDPickerArrayDataSource, item: AnyObject, component: Int)
}