//
//  SearchMediaTableViewCellTests.swift
//  ItunesSearchTestsTests
//
//  Created by Тимур Шафигуллин on 12.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import XCTest
@testable import ItunesSearchTests

class SearchMediaTableViewCellTests: XCTestCase {
    
    var searchMediaCell: SearchMediaTableViewCell!
    
    override func setUp() {
        super.setUp()
        searchMediaCell = SearchMediaTableViewCell()
    }
    
    override func tearDown() {
        searchMediaCell = nil
        super.tearDown()
    }
    
    func testThatAwakeFromNimMakeImageCornersRounded() {
        //given
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        let expectedCornerRadius = imageView.frame.size.width / 2
        searchMediaCell.mediaImageView = imageView
        
        //when
        searchMediaCell.awakeFromNib()
        
        //then
        XCTAssertEqual(expectedCornerRadius, imageView.layer.cornerRadius)
    }
    
    func testThatPrepareForReuseSetImageToNil() {
        //given
        let imageView = UIImageView()
        let image = UIImage()
        imageView.image = image
        searchMediaCell.mediaImageView = imageView
        
        //when
        searchMediaCell.prepareForReuse()
        
        //then
        XCTAssertNil(imageView.image)
    }
    
    func testThatPrepareCellSetupTextToLabels() {
        //given
        let nameLabel = UILabel()
        let authorLabel = UILabel()
        let priceLabel = UILabel()
        let descriptionLabel = UILabel()
        searchMediaCell.nameLabel = nameLabel
        searchMediaCell.authorLabel = authorLabel
        searchMediaCell.priceLabel = priceLabel
        searchMediaCell.descriptionLabel = descriptionLabel
        
        let price = 123.0
        let expectedNameText = "Name"
        let exptectedAuthorText = "Author"
        let expectedDescriptionText = "Description"
        let expectedPriceText = "Price: \(price)"
        
        let media = Media(
            name: expectedNameText,
            author: exptectedAuthorText,
            description: expectedDescriptionText,
            price: price,
            imageURL: URL(fileURLWithPath: ""),
            viewURL: URL(fileURLWithPath: "")
        )
        let searchMediaCellModel = SearchMediaCellModelImpl(media: media)
        
        //when
        searchMediaCell.prepareCell(with: searchMediaCellModel)
        
        //then
        XCTAssertEqual(expectedNameText, nameLabel.text)
        XCTAssertEqual(exptectedAuthorText, authorLabel.text)
        XCTAssertEqual(expectedDescriptionText, descriptionLabel.text)
        XCTAssertEqual(expectedPriceText, priceLabel.text)
    }
    
}
