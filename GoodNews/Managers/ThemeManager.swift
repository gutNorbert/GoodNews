//
//  ThemeManager.swift
//  GoodNews
//
//  Created by Lightport Developer on 2020. 04. 13..
//  Copyright © 2020. Lightport Developer. All rights reserved.
//

import Foundation
import UIKit

class ThemeManager {
    static func setup(){
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UINavigationBar.appearance().backgroundColor = UIColor(displayP3Red: 47/255, green: 54/255, blue: 64/255, alpha: 1.0)
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
    }
}
