//
//  PostTableViewCell.swift
//  HW_34_Networking_Part1
//
//  Created by Oleg Dynnikov on 1/27/19.
//  Copyright © 2019 Oleg Dynnikov. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    static let identifier = String(describing: PostTableViewCell.self)
    static let nib = UINib(nibName: String(describing: PostTableViewCell.self), bundle: nil)

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var userIdLabel: UILabel!
    @IBOutlet private weak var completedLabel: UILabel!
    @IBOutlet private weak var idLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func update(title: String, userId: Int, completed: Int, id: Int) {
        titleLabel.text = title
        userIdLabel.text = String(userId)
        completedLabel.text = String(completed)
        idLabel.text = String(id)
    }
}
