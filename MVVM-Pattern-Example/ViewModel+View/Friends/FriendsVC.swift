//
//  ViewController.swift
//  MVVM-Pattern-Example
//
//  Created by FayedGouda on 22/01/2023.
//

import UIKit

class FriendsVC: UIViewController {
    @IBOutlet weak var friendsTableView:UITableView!
    
    // a view model object that holds our UIViewController data, we will inject it in the viewDidLoad method
    //but this causes tightly coupled objects, I'll show you later how to make dependancy somewhere elese
    var viewModel:FriendsViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = FriendsViewModel()
        
        viewModel.didFinishLoadingFriends = {
            [weak self] success in
            
            guard success == true else {
                print("Something went wrong")
                return
            }
            self?.friendsTableView.reloadData()
        }
    }
    
    private func setUpViewConfigurations(){
        self.friendsTableView.delegate = self
        self.friendsTableView.dataSource = self
        
        self.friendsTableView.register(PersonTableViewCell.cellNib(), forCellReuseIdentifier: PersonTableViewCell.identifier)
    }
}

extension FriendsVC:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PersonTableViewCell.identifier) as! PersonTableViewCell
        //Here, we inject the cell viewModel with its model
        cell.viewModel = PersonCellViewModel(with: viewModel.friendCell(for: indexPath))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}

extension FriendsVC:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
}
