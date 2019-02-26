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
    
    @IBAction func unwindToMemoList(sender:UIStoryboardSegue){
        guard let sourceVC = sender.source as? ViewController,
        let memo = sourceVC.memo else{
            return
        }
        if let selectedIndexPath = self.tableView.indexPathForSelectedRow{
            memos[selectedIndexPath.row] = memo
        }else{ //編集でない（行が選択されていない）新規の場合
            memos.append(memo) //memosに代入
        }
        tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return memos.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "memoCell", for: indexPath)

        cell.textLabel?.text = memos[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            memos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {

        }    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editMemo"{
            let vc = segue.destination as! ViewController
            vc.memo = memos[(tableView.indexPathForSelectedRow?.row)!]
        }
    }
}
