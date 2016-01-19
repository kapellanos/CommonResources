//
//  IDArrayDatasourceConfigureBuilder.swift
//  idealista
//
//  Created by Miguel Olmedo on 13/4/15.
//
//

import UIKit

public class IDArrayDataSourceConfigureBuilder<T,U>
{
    var items:[[T]]?
    var cellIdentifier: String?
    var cellStyle: UITableViewCellStyle = .Default
    var configureCellClosure: ((cell: U, object: T) -> ())?
    
    public init(configureClosure: (configureBuilder: IDArrayDataSourceConfigureBuilder<T,U>) -> ())
    {
        configureClosure(configureBuilder: self)
    }
}

extension IDArrayDataSourceConfigureBuilder: CustomStringConvertible
{
    public var description: String {
        return "items:\(items)\ncellIdentifier: \(cellIdentifier)\ncellStyle: \(cellStyle)\ncellClosure:\(configureCellClosure)"
    }
}