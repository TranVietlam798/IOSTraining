//
//  UserListViewController+DataSource.swift
//  IOSTraining
//
//  Created by VIETLAMTR on 22/02/2566 BE.
//
import UIKit

extension UserListViewController {
    typealias DataSource = UICollectionViewDiffableDataSource<Int, User.ID>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, User.ID>
    
    var reminderCompletedValue: String {
        NSLocalizedString("Completed", comment: "User completed value")
    }
    var reminderNotCompletedValue: String {
        NSLocalizedString("Not completed", comment: "User not completed value")
    }
    
    func updateSnapshot(reloading ids: [User.ID] = []) {
        var snapshot = Snapshot()
        snapshot.appendSections([0])
        snapshot.appendItems(users.map { $0.id })
        if !ids.isEmpty {
            snapshot.reloadItems(ids)
        }
        dataSource.apply(snapshot)
    }
    func cellRegistrationHandler(
        cell:
        UICollectionViewListCell, indexPath: IndexPath, id: User.ID
    ) {
        let user = user(withId: id)
        var contentConfiguration = cell.defaultContentConfiguration()
        contentConfiguration.image = UIImage(url: URL(string: user.avatar_url))
        contentConfiguration.imageProperties.maximumSize = CGSize(width: 200, height: 200)
        contentConfiguration.text = user.login
        contentConfiguration.secondaryText = user.html_url
        
        
        cell.contentConfiguration = contentConfiguration
        
        
        var backgroundConfiguration = UIBackgroundConfiguration.listGroupedCell()
        backgroundConfiguration.backgroundColor = .orange
        cell.backgroundConfiguration = backgroundConfiguration
    }
    
    func user(withId id: User.ID) -> User {
        let index = users.indexOfUser(withId: id)
        return users[index]
    }
    
    func updateUser(_ user: User) {
        let index = users.indexOfUser(withId: user.id)
        users[index] = user
    }
    
}
extension UIImage {
  convenience init?(url: URL?) {
    guard let url = url else { return nil }
            
    do {
      self.init(data: try Data(contentsOf: url))
    } catch {
      print("Cannot load image from url: \(url) with error: \(error)")
      return nil
    }
  }
}
