//
//  ViewController.swift
//  hw4
//
//  Created by Onipko Jenya on 07.10.2020.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        // #1
        getStringLength(str: "111");
        // #2
        isRightSuffix(str: "Вадимович")
        isRightSuffix(str: "Олеговна")
        // #3
        separateName(str: "OnipkoYevhenii")
        // #4
        reverse(str: "ASDFG")
        // #5
        separateNumber(number: 123456789)
        // #6
        checkPassword(str: "aaa333A")
        // #7
        sortArray(arr: [1,4,2,10,45,32,2,8,5,8,1,3])
    }
    
    func getStringLength(str: String) -> Int {
        print(String(str.count));
        return str.count
    }
    
    func isRightSuffix(str: String) -> Bool {
        let isRight = str.hasSuffix("ич")
        print(isRight);
        return isRight;
    }
    
    func separateName(str: String) -> String {
        let firstName = str.prefix(6)
        let lastName = str.suffix(from: str.index(str.startIndex, offsetBy: 6))
        let separatedName = "\(firstName) \(lastName)";
        print(separatedName);
        return separatedName;
    }
    
    func reverse(str: String) -> String {
        var reversedNames = String();

        for ch in str {
            reversedNames.insert(ch, at: str.startIndex);
        }
        
        print(reversedNames)
        
        return reversedNames;
    }
    
    func separateNumber(number: Int) -> String {
        let str = String(number);
        
        if str.count > 9 {
            print("NOT SUPPORTED NUMBER")
            return "NOT SUPPORTED NUMBER"
        }
        
        let toHundred = str.suffix(from: str.index(str.endIndex, offsetBy: -3))
        let toTouthand = str.suffix(from: str.index(str.endIndex, offsetBy: -6)).prefix(3)
        let toMillion = str.suffix(from: str.index(str.endIndex, offsetBy: -str.count)).prefix(str.count - 6)
        
        let num = "\(toMillion),\(toTouthand),\(toHundred)"
        print(num)
        return num;
    }
    
    func checkPassword(str: String) -> Int {
        
        var strongValues = [Int]()
        
        let hasDigits: Bool = try! NSRegularExpression(pattern: "[0-9]").matches(str)
        let hasUpperCaseChars: Bool = try! NSRegularExpression(pattern: "[A-Z]").matches(str)
        let hasLowerCaseChars: Bool = try! NSRegularExpression(pattern: "[a-z]").matches(str)
        
        if hasDigits {
            strongValues.append(1);
        }
        if hasUpperCaseChars {
            strongValues.append(1);
        }
        if hasLowerCaseChars {
            strongValues.append(1);
        }
        print(strongValues.count)
        return strongValues.count;
    }
    
    func getPlace(value: Int, arr: [Int]) -> Int {
        var lessThan = [Int]();
        arr.forEach({
            if $0 < value {
                lessThan.append($0);
            }
        })

        return lessThan.count;
    }
    
    func sortArray(arr: [Int]) -> [Int] {
        var dryArr = [Int]();
        
        arr.forEach({
            if !dryArr.contains($0) {
                dryArr.append($0)
            }
        })
        
        var main = [Int]()

        dryArr.forEach({
            let place = getPlace(value: $0, arr: main)
            main.insert($0, at: abs(place))
            
        })
        
        print(main)
        
        return dryArr;
    }


}

extension NSRegularExpression {
    func matches(_ string: String) -> Bool {
        let range = NSRange(location: 0, length: string.utf16.count)
        return firstMatch(in: string, options: [], range: range) != nil
    }
}
