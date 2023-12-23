//
//  tip_calculatorSnapshotTests.swift
//  tip-calculatorTests
//
//  Created by Ryan Gallagher on 23/12/2023.
//

import XCTest
import SnapshotTesting
@testable import tip_calculator

final class tip_calculatorSnapshotTests: XCTestCase {
    
    private var screenWidth: CGFloat {
        return UIScreen.main.bounds.size.width
    }
    
    func test_logoView() {
        
        let size = CGSize(width: screenWidth, height: 48)
        
        let view = LogoView()
        
        //choose assertSnapshort, not assertSnapshots
        //record the snapshot once and then comment out record
        //assertSnapshot(matching: view, as: .image(size: size), record: true)
        assertSnapshot(matching: view, as: .image(size: size))
    }
}
