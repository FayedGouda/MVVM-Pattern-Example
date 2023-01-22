//
//  PersonTableViewCell.swift
//  MVVM-Pattern-Example
//
//  Created by FayedGouda on 22/01/2023.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var name:UILabel!
    @IBOutlet weak var username:UILabel!
    @IBOutlet weak var followingButton:UIButton!
    
    var viewModel:PersonCellViewModel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setUpFriendCellConfigurations()
    }
    
    private func setUpFriendCellConfigurations(){
        
        self.name.text = viewModel.name
        self.username.text = viewModel.userName
        
        switch viewModel.isFollowing{
        case true:
            followingButton.setTitle("Follow", for: .normal)
            followingButton.setImage(UIImage(systemName: "plus"), for: .normal)
        case false:
            followingButton.setTitle("Unfollow", for: .normal)
            followingButton.setImage(UIImage(systemName: "minus"), for: .normal)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction private func didTapFollowFriend(_ sender:UIButton){
        //the inverse of following bool
        viewModel.isFollowing = !viewModel.isFollowing
    }
    
}

//We write an extions on UITableViewCell so that we can get the nib and identifier
//Note:- Cell.xib Reusable identifier must be the same as the UITableViewCell sub class name, in our case:PersonTableViewCell
extension UITableViewCell{
    public static var identifier:String{
        return "\(Self.self)"
    }
    
   public static func cellNib()->UINib{
        return UINib(nibName: "\(Self.self)", bundle: nil)
    }
}
