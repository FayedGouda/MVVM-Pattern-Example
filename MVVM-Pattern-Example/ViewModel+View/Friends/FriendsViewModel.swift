//
//  FriendsViewModel.swift
//  MVVM-Pattern-Example
//
//  Created by FayedGouda on 22/01/2023.
//

import Foundation

class FriendsViewModel{
    
    private var friends:[FriendsModel] = []
    
    //A simple closure to tell our viewController that we did recive data successfully
    var didFinishLoadingFriends:(_ success:Bool)->Void = {success in}
    
    ///You could get this data from api call
    func getFriends(){
        friends.append(FriendsModel(id: 1, name: "Youssef", username: "@youssef"))
        friends.append(FriendsModel(id: 2, name: "Mohammed", username: "@mohammed"))
        friends.append(FriendsModel(id: 3, name: "Ahmed", username: "@ahmed"))
        friends.append(FriendsModel(id: 4, name: "Ali", username: "@ali"))
        friends.append(FriendsModel(id: 5, name: "Jack", username: "@jack"))
        
        //We will consider we recived the list successfully
        
        didFinishLoadingFriends(true)
    }
    
    ///Return number of friends
    func numberOfRows()->Int{
        return self.friends.count
    }
    
    func friendCell(for indexPath:IndexPath)->FriendsModel{
        return friends[indexPath.row]
    }
    
}


struct FriendsModel{
    let id:Int
    let name:String
    let username:String
    var isFollowing:Bool = false
}
