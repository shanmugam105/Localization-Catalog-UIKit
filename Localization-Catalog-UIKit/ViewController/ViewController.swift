//
//  ViewController.swift
//  Localization-Catalog-UIKit
//
//  Created by sparkout on 05/03/24.
//

import UIKit



class ViewController: UIViewController {

    @IBOutlet weak var appTitleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.appTitleLabel.text = "Awesome App".localized
    }

    @IBAction func translateButtonTapped(_ sender: UIButton) {
        let alertContorller: UIAlertController = .init(title: "Translate".localized, message: nil, preferredStyle: .actionSheet)
        let englishTranslation = UIAlertAction(title: "English", style: .default) { _ in
            UserDefaults.appLocale = "en"
            AppDelegate.appDelegate.setupHomeScreen()
        }
        let hindiTranslation = UIAlertAction(title: "Hindi", style: .default) { _ in
            UserDefaults.appLocale = "hi"
            AppDelegate.appDelegate.setupHomeScreen()
        }
        let spanishTranslation = UIAlertAction(title: "Spanish", style: .default) { _ in
            UserDefaults.appLocale = "es"
            AppDelegate.appDelegate.setupHomeScreen()
        }
        alertContorller.addAction(hindiTranslation)
        alertContorller.addAction(englishTranslation)
        alertContorller.addAction(spanishTranslation)
        self.present(alertContorller, animated: true)
    }
}

extension String {
    var localized: String {
        let path = Bundle.main.path(forResource: UserDefaults.appLocale, ofType: "lproj")
        let bundle = Bundle(path: path!)
        let str = NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
        return str
    }
}
