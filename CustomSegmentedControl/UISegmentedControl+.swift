//
//  UISegmentedControl+.swift
//  CustomSegmentedControl
//
//  Created by KIM HOSE on 2022/06/24.
//

import UIKit

extension UISegmentedControl {
  func fixBackgroundSegmentControl() {
    if #available(iOS 13.0, *) {

      DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {

        for i in 0...(self.numberOfSegments-1)  {

          let backgroundSegmentView = self.subviews[i]
          backgroundSegmentView.isHidden = true
        }
      }
    }
  }
}
