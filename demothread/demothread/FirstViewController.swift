//
//  FirstViewController.swift
//  demothread
//
//  Created by YZH on 2018/1/7.
//  Copyright © 2018年 YZH. All rights reserved.
//

import UIKit
import Foundation
class FirstViewController: UIViewController {
    var mdata1:String?="US.png"
    var mdata2:String?="ZW.png"
    let operation1 = BlockOperation()
    let operation2 = BlockOperation()
    var image:UIImage?
    let queue = OperationQueue()
    @IBOutlet weak var mylabel: UILabel!
    @IBOutlet weak var myImage1: UIImageView!
    @IBOutlet weak var myImage2: UIImageView!
    
    @IBAction func clickSend(_ sender: UIButton) {
        
        //BlockOperation()Operation系统提供的子类
       // operation.queuePriority = .veryHigh
        //addExecutionBlock将指定的块添加到接收方要执行的块列表中
        operation1.addExecutionBlock {
            print("1")
            DispatchQueue.main.async {
                print("2")
                self.myImage1.image=UIImage(named: self.mdata1!)
            }
        }
        operation2.addExecutionBlock {
            print("3")
            DispatchQueue.main.async {
                print("4")
                self.myImage2.image=UIImage(named: self.mdata2!)
            }
        }
        queue.addOperation(operation1)
        queue.addOperation(operation2)
        sleep(2)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       self.mylabel.text="请点击发送过来的数据"
    }
    
    @IBAction func stop(_ sender: UIButton) {
        queue.isSuspended=true
    }

    @IBAction func replace(_ sender: UIButton) {
         queue.isSuspended=false
    }
}

