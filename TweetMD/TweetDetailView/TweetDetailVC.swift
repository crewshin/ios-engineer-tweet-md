//
//  TweetDetailVC.swift
//  TweetMD
//
//  Created by Kimberly Hsiao on 1/24/19.
//  Copyright © 2019 Doximity. All rights reserved.
//

import Foundation
import UIKit

protocol TweetDetailVCDelegate: class {
    func favoriteButtonTappedFor(id: Int)
}

class TweetDetailVC: UIViewController {
    
    // MARK: Properties
    
    private let viewModel: TweetDetailVMContract
    
    weak var delegate: TweetDetailVCDelegate?
    
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
        
        setupFavoriteButton()
        setupProfileImage()
    }
    
    // MARK: Setup
    
    func setupFavoriteButton() {
        if viewModel.isFavorite {
            favoriteButton.setTitle("Remove from Favorites", for: .normal)
            favoriteButton.backgroundColor = .darkGray
        } else {
            favoriteButton.setTitle("Add to Favorites", for: .normal)
            favoriteButton.backgroundColor = .actionBlue
        }
    }
    
    func setupProfileImage() {
        // Use loading image here.
        // self.thumbnailImageView.image = UIImage(named: "loadingImage")
        viewModel.fetchProfilePhoto { (result) in
            switch result {
            case .failure(_):
                // Display "no-image" here instead of nil.
                self.thumbnailImageView.image = nil
            case .success(let imageData):
                let image = UIImage(data: imageData)
                self.thumbnailImageView.image = image
            }
        }
    }
    
    // MARK: IBActions
    
    @IBAction func favoritesButtonTapped(_ sender: UIButton) {
        delegate?.favoriteButtonTappedFor(id: viewModel.tweet.id)
        setupFavoriteButton()
    }
}
