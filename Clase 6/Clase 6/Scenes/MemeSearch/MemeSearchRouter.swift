//
//  MemeSearchRouter.swift
//  Clase 6
//
//  Created by Luis Padilla  on 2/23/19.
//  Copyright (c) 2019 Luis Padilla . All rights reserved.
//

import UIKit

@objc protocol MemeSearchRoutingLogic {
    //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol MemeSearchDataPassing {
    var dataStore: MemeSearchDataStore? { get }
}

class MemeSearchRouter: NSObject, MemeSearchRoutingLogic, MemeSearchDataPassing {
    weak var viewController: MemeSearchViewController?
    var dataStore: MemeSearchDataStore?
    
    // MARK: Routing
    
    //func routeToSomewhere(segue: UIStoryboardSegue?)
    //{
    //  if let segue = segue {
    //    let destinationVC = segue.destination as! SomewhereViewController
    //    var destinationDS = destinationVC.router!.dataStore!
    //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //  } else {
    //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
    //    var destinationDS = destinationVC.router!.dataStore!
    //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //    navigateToSomewhere(source: viewController!, destination: destinationVC)
    //  }
    //}
    
    // MARK: Navigation
    
    //func navigateToSomewhere(source: MemeSearchViewController, destination: SomewhereViewController)
    //{
    //  source.show(destination, sender: nil)
    //}
    
    // MARK: Passing data
    
    //func passDataToSomewhere(source: MemeSearchDataStore, destination: inout SomewhereDataStore)
    //{
    //  destination.name = source.name
    //}
}
