//
//  PersonCellViewModel.swift
//  MVVM-Pattern-Example
//
//  Created by FayedGouda on 22/01/2023.
//

import Foundation

class PersonCellViewModel{
    
    private var model:FriendsModel
    
    init(with model:FriendsModel){
        self.model = model
    }
}

extension PersonCellViewModel {
    var name:String{
        return model.name
    }
    
    var userName:String{
        return model.username
    }
    
    var isFollowing:Bool{
        get {
            return model.isFollowing
        }
        
        set {
            self.isFollowing = newValue
        }
       
    }
    
}
