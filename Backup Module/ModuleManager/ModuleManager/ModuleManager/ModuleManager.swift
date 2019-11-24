//
//  ModuleManager.swift
//  ModuleManager
//
//  Created by Trevin Wisaksana on 20/11/19.
//  Copyright © 2019 Stockbit. All rights reserved.
//

import Foundation

public final class ModuleManager {
    public static let shared = ModuleManager()
    
    private var modules = [String: Any]()
    
    public func register<T>(withType type: T.Type, module: Any) {
        let key = String(describing: type)
        modules[key] = module
    }
    
    public func module<T>(withType type: T.Type) -> T? {
        let key = String(describing: type)
        
        guard let module = modules[key] as? T else {
            return nil
        }
        
        return module
    }
}
