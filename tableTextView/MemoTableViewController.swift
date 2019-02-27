//
//  MemoTableViewController.swift
//  tableTextView
//
//  Created by 古賀賢司 on 2019/02/24.
//  Copyright © 2019 古賀賢司. All rights reserved.
//

import UIKit

class MemoTableViewController: UITableViewController {
    
    var memos = ["red","yellow","blue","green"]
    
    @IBAction func unwindToMemoList(sender:UIStoryboardSegue){ //ViewControllerのsaveButtonで保存した内容が渡る
        guard let sourceVC = sender.source as? ViewController, //ViewControllerをキャストする
        let memo = sourceVC.memo else{ //ViewControllerのmemoをこのmemoに代入
            return //できない場合は戻す
        }
        if let selectedIndexPath = self.tableView.indexPathForSelectedRow{ //選択している行を代入
            memos[selectedIndexPath.row] = memo //選択している行にmemo(17行目でViewControllerから渡ってきたmemo)を代入
        }else{ //編集でない（行が選択されていない）新規の場合
            memos.append(memo) //memosに代入
        }
        tableView.reloadData() //内容を更新して表示
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return memos.count //memosの数分cellにして表示
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "memoCell", for: indexPath)

        cell.textLabel?.text = memos[indexPath.row] //memosの中身をtext部分に表示
        return cell
    }
    //行を選択したときに動くswipe
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete { //右にスワイプで削除表示
            memos.remove(at: indexPath.row) //配列の指定内容を削除
            tableView.deleteRows(at: [indexPath], with: .fade) //行も削除
        } else if editingStyle == .insert { //編集する場合

        }    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { //segueでViewControllerに渡すもの
        if segue.identifier == "editMemo"{ //segueのidentifierがeditMemoであれば
            let vc = segue.destination as! ViewController //ViewControllerにキャスト
            vc.memo = memos[(tableView.indexPathForSelectedRow?.row)!] //ViewControllerのmemoに選択行の内容を渡す
        }
    }
}
