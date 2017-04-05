//
//  ViewController.swift
//  Silly Song
//
//  Created by Harry  Philip on 4/5/17.
//  Copyright © 2017 Harry  Philip. All rights reserved.
//

import UIKit

let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")

func shortNameForName(name: String) -> String {
    // Got solution for finding vowels from http://stackoverflow.com/a/41473715
    
    let vowels = CharacterSet(charactersIn: "aeiou")
    
    let lowercaseName = name.lowercased()
    
    let first_vowel : String.Index! = lowercaseName.rangeOfCharacter(from: vowels)?.lowerBound
    if (first_vowel != nil){
        return lowercaseName.substring(from: first_vowel )
    } else {
        return lowercaseName
    }
}

func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    
    let shortName = shortNameForName(name: fullName)
    
    let lyrics = lyricsTemplate
        .replacingOccurrences(of: "<FULL_NAME>", with: fullName)
        .replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
    
    return lyrics
}
class ViewController: UIViewController {

    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var lyricsView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func reset(_ sender: Any) {
        nameField.text = ""
        lyricsView.text = ""
    }
    @IBAction func displayLyrics(_ sender: Any) {
        if (nameField.text == ""){
            return
        }
        let name : String! = nameField.text
        let lyrics = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: name)
        lyricsView.text = lyrics
    }

}
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}



