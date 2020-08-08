//
//  UITableView+Reusable.swift
//  DemoProject
//
//  Created by Chaithra Shrikrishna on 08/08/20.
//  Copyright © 2020 Chaithra Shrikrishna. All rights reserved.
//

import UIKit

extension UITableView {
    
    func registerNibCell<T: UITableViewCell>(nibClass: T.Type) {
        let nibName = "\(T.self)"
        let bundle = Bundle(for: nibClass)
        self.register(UINib(nibName: nibName, bundle: bundle), forCellReuseIdentifier: nibName)
    }
    
    func registerCellClass<T: UITableViewCell>(cellClass: T.Type) {
        let reuseIdentifier = "\(T.self)"
        register(cellClass, forCellReuseIdentifier: reuseIdentifier)
    }
    
    func registerNibHeaderFooter<T: UITableViewHeaderFooterView>(nibClass: T.Type) {
        let nibName = "\(T.self)"
        let bundle = Bundle(for: nibClass)
        self.register(UINib(nibName: nibName, bundle: bundle), forHeaderFooterViewReuseIdentifier: nibName)
    }
    
    func registerClassHeaderFooter<T: UITableViewHeaderFooterView>(className classItem: T.Type) {
        let className = "\(T.self)"
        self.register(classItem, forHeaderFooterViewReuseIdentifier: className)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(className: T.Type, for indexPath: IndexPath) -> T {
        let name = "\(T.self)"
        guard let cell = self.dequeueReusableCell(withIdentifier: name, for: indexPath) as? T else {
            fatalError("Error: dequeueReusableCell: \(NSStringFromClass(T.self)) " +
                "for index path: \(indexPath) is not \(T.self)")
        }
        return cell
    }
    
    func dequeueReusableCell<T: UITableViewCell>(className: T.Type) -> T {
        let name = "\(T.self)"
        guard let cell = self.dequeueReusableCell(withIdentifier: name) as? T else {
            fatalError("Error: dequeueReusableCell: \(NSStringFromClass(T.self)) is not \(T.self)")
        }
        return cell
    }
    
    func dequeueResuableHeaderFooterView<T: UITableViewHeaderFooterView>(className: T.Type) -> T {
        let name = "\(T.self)"
        guard let resultView = dequeueReusableHeaderFooterView(withIdentifier: name) as? T else {
            fatalError("Error: dequeueResuableHeaderFooterView: \(NSStringFromClass(T.self)) is not \(T.self)")
        }
        return resultView
    }
    
}
