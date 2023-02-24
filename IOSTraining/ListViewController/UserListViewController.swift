import UIKit

class UserListViewController: UICollectionViewController {
    var dataSource: DataSource!
    var users : [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        APIHandler.sharedInstance.fetchDataListUser{ [self] apiData in
            users = apiData
            updateSnapshot()
            
        }
        let listLayout = listLayout()
        collectionView.collectionViewLayout = listLayout
        
        let cellRegistration = UICollectionView.CellRegistration(handler: cellRegistrationHandler)
        
        dataSource = DataSource(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: User.ID) in
            return collectionView.dequeueConfiguredReusableCell(
                using: cellRegistration, for: indexPath, item: itemIdentifier)
        }
        
        var snapshot = Snapshot()
        snapshot.appendSections([0])
        snapshot.appendItems(users.map { $0.id })
        dataSource.apply(snapshot)
        
        updateSnapshot()
        collectionView.dataSource = dataSource
    }
    
    override func collectionView(
        _ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath
    ) -> Bool {
        let id = users[indexPath.item].id
        pushDetailViewForUser(withId: id)
        return false
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let user = users[indexPath.item]
//        print("aaaaa", user)
//        let viewController = segue.destination as!UserDetailViewController
//        viewController.user = user
//        navigationController?.pushViewController(viewController, animated: true)
//    }
    func pushDetailViewForUser(withId id: User.ID) {
        let user = user(withId: id)
        print("aaaaa", user)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "userDetail") as? UserDetailViewController
        viewController?.user = user
        navigationController?.pushViewController(viewController ?? UIViewController(), animated: true)
        
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)        let viewCOntroler = storyboard.instantiateViewController(withIdentifier: "personDetail") as? PersonViewController        viewCOntroler?.person = person        navigationController?.pushViewController(viewCOntroler ?? UIViewController(), animated: true)
    }
    
    private func listLayout() -> UICollectionViewCompositionalLayout {
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
        listConfiguration.showsSeparators = false
        listConfiguration.backgroundColor = .clear
        return UICollectionViewCompositionalLayout.list(using: listConfiguration)
    }
    
    
    
}
