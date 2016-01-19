//
//  IDArrayMultipleDataSourceConfigure.swift
//  idealista
//
//  Created by Miguel Olmedo on 10/4/15.
//
//

import UIKit

public class IDArrayDataSourceConfigurator<T,U>
{
    var cellIdentifier: String
    var cellStyle: UITableViewCellStyle
    var configureCellClosure: ((cell: U, object: T) -> ())?
    
    private var items: [[T]]
    
    public init(builder: IDArrayDataSourceConfigureBuilder<T,U>)
    {
        cellIdentifier = builder.cellIdentifier ?? ""
        cellStyle = builder.cellStyle ?? .Default
        configureCellClosure = builder.configureCellClosure
        items = builder.items ?? [[]]
    }
    
    func numberOfSections() -> Int
    {
        return items.count
    }
    
    func numberOfRowsInSection(section: Int) -> Int
    {
        return items[section].count
    }
    
    func item(indexPath indexPath: NSIndexPath) -> T?
    {
        return items[indexPath.section][indexPath.row]
    }
    
    func update(items items: [[T]])
    {
        self.items = items
    }
    
    func insert(item: T, indexPath:NSIndexPath)
    {
        self.items[indexPath.section][indexPath.row] = item
    }
}

extension IDArrayDataSourceConfigurator: CustomStringConvertible
{
    public var description: String {
        return "cellIdentifier: \(cellIdentifier) cellStyle: \(cellStyle)"
    }
}
