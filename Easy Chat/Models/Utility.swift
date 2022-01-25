//
//  Utility.swift
//  Easy Chat
//
//  Created by Ishaan Sarna on 25/01/22.
//  Copyright © 2022 Ishaan Sarna. All rights reserved.
//

import UIKit

func validationError(error e: Error, uiViewController: UIViewController) {
    print(e)
    let alert = UIAlertController(title: "Error", message: "\(e.localizedDescription)", preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
        NSLog("The \"OK\" alert occured.")
    }))
    uiViewController.present(alert, animated: true, completion: nil)
}

func navigationBarSet(navigationController: UINavigationController?) {
    let appearance = UINavigationBarAppearance()
    appearance.configureWithOpaqueBackground()
    appearance.backgroundColor = UIColor(named: K.BrandColors.blue)
    appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
    navigationController?.navigationBar.standardAppearance = appearance;
    navigationController?.navigationBar.scrollEdgeAppearance = appearance
}
