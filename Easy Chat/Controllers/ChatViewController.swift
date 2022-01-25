//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Ishaan Sarna on 25/01/2021.
//  Copyright © 2021 Ishaan Sarna. All rights reserved.
//

import UIKit
import Firebase

class ChatViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    let db = Firestore.firestore()
    
    var messages: [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        
        loadMessages()
    }
    
    func loadMessages() {
        db.collection(K.FStore.collectionName)
            .order(by: K.FStore.dateField)
            .addSnapshotListener {
                querySnapshot, error in
                if let e = error {
                    validationError(error: e, uiViewController: self)
                } else {
                    
                    self.messages = []
                    
                    if let documents = querySnapshot?.documents {
                        for document in documents {
                            self.messages.append(Message(sender: document.data()[K.FStore.senderField] as! String,
                                                         body: document.data()[K.FStore.bodyField] as! String,
                                                         date: document.data()[K.FStore.dateField] as! TimeInterval))
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                            }
                        }
                    }
                }
            }
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        if let messageBody = messageTextfield.text, let messageSender = Auth.auth().currentUser?.email {
            db.collection(K.FStore.collectionName).addDocument(data:
                                                                [K.FStore.senderField: messageSender,
                                                                 K.FStore.bodyField: messageBody,
                                                                 K.FStore.dateField: Date.timeIntervalSinceReferenceDate]) {
                (error) in
                if let e = error {
                    validationError(error: e, uiViewController: self)
                } else {
                    self.messageTextfield.text = ""
                }
            }
        }
    }
    
    
    @IBAction func LogoutPressed(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
        
    }
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! TableViewCell
        cell.label?.text = messages[indexPath.row].body
        return cell
    }
    
    
}
