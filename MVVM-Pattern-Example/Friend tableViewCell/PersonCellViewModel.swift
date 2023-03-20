//
//  PersonCellViewModel.swift
//  MVVM-Pattern-Example
//
//  Created by FayedGouda on 22/01/2023.
//

import Foundation

class PersonCellViewModel{
    
    private var model:FriendsModel
    
    var updateCellAt:(_ indexPath:IndexPath)->Void = { index in }
    
    var isFollowing:Bool
    init(with model:FriendsModel){
        self.model = model
        isFollowing = model.isFollowing
    }
}

extension PersonCellViewModel {
    var name:String{
        return model.name
    }
    
    var userName:String{
        return model.username
    }
}
