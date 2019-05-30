//
//  ViewController.swift
//  sockettest
//
//  Created by YZH on 2018/1/10.
//  Copyright © 2018年 YZH. All rights reserved.
//

import UIKit

class ViewController: UIViewController,GCDAsyncSocketDelegate {

    var msocket:GCDAsyncSocket?
    
    @IBAction func connectAction(_ sender: UIButton) {
        msocket=GCDAsyncSocket(delegate: self, delegateQueue: DispatchQueue.main)
            let host = "192.168.4.1"
            let port = 8086
//        let host = "192.168.0.2"
//        let port = 6666
        do {
            try msocket?.connect(toHost: host, onPort: UInt16(port))
            addmessage(message: "断开")
        }catch{
        }
    }
    @IBAction func close(_ sender: UIButton) {
        msocket?.disconnect()
         addmessage(message: "断开")
    }
    //发送到服务端把数据
    @IBAction func send(_ sender: UIButton) {
        msocket?.write(sendmessage.text.data(using: String.Encoding.utf8)!, withTimeout: -1, tag: 0)
    }
    @IBOutlet weak var messageTextView: UITextView!
    @IBOutlet weak var sendMsgTextField: UITextField!
    @IBOutlet weak var portTextField: UITextField!
    @IBOutlet weak var sendmessage: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //建立连接后回调机制
    func socket(_ sock: GCDAsyncSocket, didConnectToHost host: String, port: UInt16) {
        addmessage(message: "连接成功")
        addmessage(message: "连接服务器\(host):\(port)")
        msocket?.readData(withTimeout: -1, tag: 0)
    }
    
    //接受来自服务端的消息
    func socket(_ sock: GCDAsyncSocket, didRead data: Data, withTag tag: Int) {
        let msg = String(data: data, encoding: String.Encoding.utf8)
       
        msocket?.readData(withTimeout: -1, tag: 0)
        if (msg?.starts(with: "ren"))!{
            addmessage(message: msg!)
        }
      
        
    }
    
    func addmessage(message:String){
        messageTextView.text=messageTextView.text.appendingFormat("%@\n", message)
    }
}

