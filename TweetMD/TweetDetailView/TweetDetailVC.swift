//
//  TweetDetailVC.swift
//  TweetMD
//
//  Created by Kimberly Hsiao on 1/24/19.
//  Copyright © 2019 Doximity. All rights reserved.
//

import Foundation
import UIKit

class TweetDetailVC: UIViewController {
    
    // MARK: Properties
    
    private let viewModel: TweetDetailVMContract
    
    @IBOutlet private var thumbnailImageView: UIImageView!
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var handleLabel: UILabel!
    @IBOutlet private var contentLabel: UILabel!
    @IBOutlet private var favoriteButton: UIButton!
    @IBOutlet private var dateLabel: UILabel!
    
    // MARK: Init
    
    init(viewModel: TweetDetailVMContract) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: type(of: self)), bundle: Bundle.main)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = viewModel.authorName
        handleLabel.text = viewModel.authorHandle
        contentLabel.text = viewModel.content
        dateLabel.text = viewModel.dateString
        thumbnailImageView.image = viewModel.authorProfilePhoto
    }
}
