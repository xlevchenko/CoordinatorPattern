//
//  MainCoordinator.swift
//  CordinatorPattern
//
//  Created by Olexsii Levchenko on 02.11.2025.
//

import UIKit

protocol MainCoordinatorDelegate: AnyObject {
    func onMainCoordinationComplete(cordinator: MainCoordinator)
}

enum NavigationBarTag: Int {
    case home
    case locations
    case more
}

class MainCoordinator: BaseCoordinator<UINavigationController> {
    
    weak var delegate: MainCoordinatorDelegate?
    
    override func start() {
        presenter.setNavigationBarHidden(true, animated: false)
        
        showTabBarView()
    }
}


//MARK: - Showing screen
private extension MainCoordinator {
    
    func showTabBarView () {
        let homeCoordinator = configureHomeCoordinator()
        let locationCoordinator = configureLocationsCoordinator()
        let moreCoordinator = configureMoreCoordinator()
        
        let controllers = [
            homeCoordinator.presenter,
            locationCoordinator.presenter,
            moreCoordinator.presenter
        ]
        
        let tabBarController = UITabBarController()
        tabBarController.setViewControllers(controllers, animated: false)
        presenter.setViewControllers([tabBarController], animated: true)
    }
}


//MARK: - Sub Coordinatorss
private extension MainCoordinator {
    
    func configureHomeCoordinator() -> HomeCoordinator {
        let flowPresenter = UINavigationController()
        flowPresenter.tabBarItem = UITabBarItem(
            title: "Home",
            image: UIImage(systemName: "house"),
            tag: NavigationBarTag.home.rawValue
        )
        let coordinator = HomeCoordinator(presenter: flowPresenter)
        coordinator.start()
        
        store(coordinator: coordinator)
        return coordinator
    }
    
    func configureLocationsCoordinator() -> LocationsCoordinator {
        let flowPresenter = UINavigationController()
        flowPresenter.tabBarItem = UITabBarItem(
            title: "Locs",
            image: UIImage(systemName: "mappin.and.ellipse"),
            tag: NavigationBarTag.locations.rawValue
        )
        let coordinator = LocationsCoordinator(presenter: flowPresenter)
        coordinator.start()
        
        store(coordinator: coordinator)
        return coordinator
    }
    
    func configureMoreCoordinator() -> MoreCoordinator {
        let flowPresenter = UINavigationController()
        flowPresenter.tabBarItem = UITabBarItem(
            title: "More",
            image: UIImage(systemName: "line.3.horizontal"),
            tag: NavigationBarTag.more.rawValue
        )
        let coordinator = MoreCoordinator (presenter: flowPresenter)
        coordinator.delegate = self
        coordinator.start()
            
        store(coordinator: coordinator)
        return coordinator
    }
}


//MARK: - MoreDelegate
extension MainCoordinator: MoreDelegate {
    func onMoreLogoutTapped(cordinator: MoreCoordinator) {
        delegate?.onMainCoordinationComplete(cordinator: self)
        self.free(coordinator: cordinator)
    }
}
