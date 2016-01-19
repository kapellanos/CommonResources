//
//  IDCollectionViewDataSource.swift
//  idealista
//
//  Created by Miguel Olmedo on 8/9/15.
//
//

import Foundation

class IDCollectionViewArrayDataSource<T,U: UICollectionViewCell>: NSObject, UICollectionViewDataSource
{
    private let configurator: IDArrayDataSourceConfigurator<T,U>
    
    init(configurator: IDArrayDataSourceConfigurator<T,U>)
    {
        self.configurator = configurator
    }
    
    @objc func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(configurator.cellIdentifier, forIndexPath: indexPath) as? U
        if let configureCellClosure = configurator.configureCellClosure, item = configurator.item(indexPath: indexPath), collectionViewCell = cell {
            configureCellClosure(cell: collectionViewCell, object: item)
        }
        
        return cell ?? UICollectionViewCell()
    }
    
    @objc func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return configurator.numberOfRowsInSection(section)
    }
    
    @objc func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int
    {
        return configurator.numberOfSections()
    }

    func itemWithIndexPath(indexPath: NSIndexPath) -> T?
    {
        return configurator.item(indexPath: indexPath)
    }
    
    func updateItems(items: [[T]])
    {
        configurator.update(items: items)
    }
    
    func inserItem(item: T, indexPath: NSIndexPath)
    {
        configurator.insert(item, indexPath: indexPath)
    }
}