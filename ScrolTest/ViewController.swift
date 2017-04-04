//
//  ViewController.swift
//  ScrolTest
//
//  Created by admin on 8 Nisan 5777.
//  Copyright © 5777 Matan alpha. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
    
    let cellReuseIdentifier = "cell"
    let cellSpacingHeight: CGFloat = 5
    
    
    var originalLayerSet  = false
    
    
    var cornerRadius: CGFloat?
    
    var borderWidth: CGFloat?
    
    var borderColor: CGColor?
    
    var bgColor: UIColor?
    
    @IBOutlet weak var myTable: UITableView!
    var indexPaths : [IndexPath?]?
    override func
        viewDidLoad() {
        super.viewDidLoad()
        
        
        //self.myTable.register(MyTableCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        myTable.delegate = self
        myTable.dataSource = self
        //questionText.text = currentQuestion.questionText
        //self.contentViewControler.title = getTitleText()
        
        myTable.estimatedRowHeight = 140 //use an appropriate estimate
        myTable.rowHeight = UITableViewAutomaticDimension
        
        indexPaths =  [IndexPath?](repeating: nil, count: 5)
        myTable.reloadData();
        
        myLabel.sizeToFit()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    // There is just one row in every section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    // Set the spacing between sections
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }
    
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:MyTableCell = self.myTable.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! MyTableCell!
        // note that indexPath.section is used rather than indexPath.row
//        let cellLabel = UILabel.init(frame: cell.frame)
//        cellLabel.numberOfLines = 0
//        cellLabel.text = "\(indexPath.section + 1). assssssssss" + myLabel.text!
//        cellLabel.sizeToFit()
//        cell.addSubview(cellLabel)
        cell.cellLabel.text = "\(indexPath.section + 1). assssssssss" + myLabel.text!
        
        // [label release];
        
        // add border and color
        cell.backgroundColor = UIColor.white
        
        
        if(!originalLayerSet)
        {
            cornerRadius = cell.layer.cornerRadius
            borderWidth = cell.layer.borderWidth
            borderColor = cell.layer.borderColor
            bgColor = cell.backgroundColor
            originalLayerSet = true
        }else
        {
            restoreCell(cell:  cell)
        }
        
        
        cell.textLabel?.font = UIFont(name: (cell.textLabel?.font.fontName)!, size: 25)
        cell.textLabel?.textColor = UIColor.lightGray
        cell.cellLabel.sizeToFit()
        
        return cell
    }
    
    func restoreCell(cell:UITableViewCell)
    {
        if (originalLayerSet)
        {
            cell.layer.borderColor = borderColor
            cell.layer.borderWidth = borderWidth!
            cell.layer.cornerRadius = cornerRadius!
            cell.backgroundColor = bgColor
        }
        cell.clipsToBounds = false
    }
    
    
    func highlightCell(cell:UITableViewCell)
    {
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 8
        cell.backgroundColor = UIColor.gray
        cell.clipsToBounds = true
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // note that indexPath.section is used rather than indexPath.row
        
        if let tappedIndex = indexPaths![0] {
            let cell:UITableViewCell = tableView.cellForRow(at: tappedIndex) as UITableViewCell!
            restoreCell(cell: cell)
        }
        
        let cell:UITableViewCell = tableView.cellForRow(at: indexPath) as UITableViewCell!
        highlightCell(cell: cell)
        
        indexPaths![0] = indexPath
        // myQuiz.setCurrentAnswerIndex(index: indexPath.section)
        print("You tapped cell number \(indexPath.section).")
    }
    
    
    
    @IBOutlet weak var myLabel: UILabel!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
