//
//  ViewController.swift
//  tableTextView
//
//  Created by 古賀賢司 on 2019/02/24.
//  Copyright © 2019 古賀賢司. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {
    
    var memo:String?

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let memo = self.memo{ //MemoTableViewControllerから渡ってきた行の中身をmemoに代入
            textView.text = memo //上記をtextView内に表示
        }
    }
    
    @IBAction func cancel(_ sender: Any) { //cancelボタンを押した場合の挙動
        if presentingViewController is UINavigationController{ 
            self.dismiss(animated: true, completion: nil) //modalにて渡ってきた場合に前画面に戻る
        }else{
            navigationController?.popViewController(animated: true) //navigationControllerで渡ってきた場合前に戻る
        }
        
    }
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { //saveButtonを押した時の挙動
        guard let button = sender as? UIBarButtonItem, button == saveButton else { //buttonによる遷移の管理
            return //他のボタンだと遷移しない
        }
        self.memo = self.textView.text ?? "" //saveButtonの挙動時にtextViewの中身をMemoTableViewControllerに渡す
    }
}
