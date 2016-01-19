//
//  IDCollectionDataManagerProtocol.swift
//  idealista
//
//  Created by Enrique Fau on 23/6/15.
//
//

import Foundation

protocol IDCollectionDataManagerProtocol
{
    typealias T
    
    func updateItems(items: [[T]])
    func addItem(item: T)
    func addItem(item: T, section: Int)
    func removeItem(item: T)
    func obtainArray() -> [[T]]?
    func obtainItem(section: Int, index: Int) -> T?
}
