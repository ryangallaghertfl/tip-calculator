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
    
    func test_initialResultView() {
        
        let size = CGSize(width: screenWidth, height: 224)
        
        let view = ResultView()
        
        //assertSnapshot(matching: view, as: .image(size: size), record: true)
        assertSnapshot(matching: view, as: .image(size: size))
    }
    
    func test_initialResultViewWithValues() {
        
        let size = CGSize(width: screenWidth, height: 224)
        let result = Result(amountPerPerson: 55.0, totalBill: 110, totalTip: 10)
        
        let view = ResultView()
        view.configure(result: result)
        
        //assertSnapshot(matching: view, as: .image(size: size), record: true)
        assertSnapshot(matching: view, as: .image(size: size))
    }
    
    func test_initialBillInputView() {
        
        let size = CGSize(width: screenWidth, height: 56)
        
        let view = BillInputView()
        
        //assertSnapshot(matching: view, as: .image(size: size), record: true)
        assertSnapshot(matching: view, as: .image(size: size))
    }
    
    func test_initialTipInputView() {
        
        let size = CGSize(width: screenWidth, height: 56+56+16)
        
        let view = TipInputView()
        
        //assertSnapshot(matching: view, as: .image(size: size), record: true)
        assertSnapshot(matching: view, as: .image(size: size))
    }
    
    func test_initialSplitInputView() {
        
        let size = CGSize(width: screenWidth, height: 56)
        
        let view = SplitInputView()
        
        //assertSnapshot(matching: view, as: .image(size: size), record: true)
        assertSnapshot(matching: view, as: .image(size: size))
    }
}

//this will allow us to access all subviews of the UIView type, which helps me examine the textfields inside of BillInputView

extension UIView {
    //        - https://stackoverflow.com/a/45297466/6181721

    /** This is the function to get subViews of a view of a particular type
*/
    func subViews<T : UIView>(type : T.Type) -> [T]{
        var all = [T]()
        for view in self.subviews {
            if let aView = view as? T{
                all.append(aView)
            }
        }
        return all
    }


/** This is a function to get subViews of a particular type from view recursively. It would look recursively in all subviews and return back the subviews of the type T */
        func allSubViewsOf<T : UIView>(type : T.Type) -> [T]{
            var all = [T]()
            func getSubview(view: UIView) {
                if let aView = view as? T{
                all.append(aView)
                }
                guard view.subviews.count>0 else { return }
                view.subviews.forEach{ getSubview(view: $0) }
            }
            getSubview(view: self)
            return all
        }
    }
