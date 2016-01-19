//
//  IDArrayDataSource.swift
//  idealista
//
//  Created by Miguel Olmedo on 7/9/15.
//
//

import UIKit

class IDTableViewArrayDataSource<T,U: UITableViewCell>: NSObject, UITableViewDataSource
{
    private let configurator: IDArrayDataSourceConfigurator<T,U>
    
    init(configurator: IDArrayDataSourceConfigurator<T,U>)
    {
        self.configurator = configurator
    }
    
    // MARK: - Public API
    
    func objectAtIndexPath(indexPath: NSIndexPath) -> T?
    {
        return configurator.item(indexPath: indexPath)
    }
    
    func updateItems(items: [[T]])
    {
        configurator.update(items: items)
    }
    
    // MARK: - UITableViewDataSource
    
    @objc func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return configurator.numberOfSections()
    }
    
    @objc func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return configurator.numberOfRowsInSection(section)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell = tableView.dequeueReusableCellWithIdentifier(configurator.cellIdentifier) as? U
        
        if cell == nil {
            cell = U(style: configurator.cellStyle, reuseIdentifier: configurator.cellIdentifier)
        }
        
        if let item = configurator.item(indexPath: indexPath), closure = configurator.configureCellClosure {
            closure(cell: cell!, object: item)
        }
        
        return cell!
    }
}