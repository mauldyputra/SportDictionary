//
//  WalkthroughView.swift
//  SportDictionary
//
//  Created by Mauldy Putra on 07/06/21.
//

import UIKit
import FSPagerView
import PageControls

protocol WalkhthroughViewDelegate:class {
    func skipPressed()
    func finished()
}

class WalkthroughView: MasterView {
    
    @IBOutlet weak var contentPagerView: FSPagerView!
    {
        didSet {
            self.contentPagerView.register(UINib(nibName: R.nib.walkthroughCell.name, bundle: nil), forCellWithReuseIdentifier: R.reuseIdentifier.walkthroughCellIdentifier.identifier)
            self.contentPagerView.itemSize = FSPagerView.automaticSize
        }
    }
    @IBOutlet weak var pageControl: PillPageControl!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var nextButtonWidth: NSLayoutConstraint!
    weak var delegate: WalkhthroughViewDelegate!
    var messageList: [String] = []
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private func setupPageControl() {
        pageControl.pillSize = CGSize(width: 20, height: 6)
        pageControl.activeTint = Colors.blue
        pageControl.inactiveTint = Colors.greenLight
    }
    
    func setContent(messageList: [String]?) {
        setupPageControl()
        
        guard let messageList = messageList, messageList.count > 0 else { return }
        self.messageList = messageList
        self.pageControl.pageCount = self.messageList.count
        contentPagerView.reloadData()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.handlePage(currentIndex: self.contentPagerView.currentIndex)
        }
    }
    
    @IBAction func onSkipPressed(_ sender: Any) {
        delegate?.skipPressed()
    }
    
    @IBAction func onNextButtonPressed(_ sender: Any) {
        if (contentPagerView.currentIndex + 1 == numberOfItems(in: self.contentPagerView)) {
            delegate.finished()
        } else {
            let nextIndex = contentPagerView.currentIndex + 1
            contentPagerView.scrollToItem(at: nextIndex, animated: true)
            handlePage(currentIndex: nextIndex)
        }
    }
    
    private func handlePage(currentIndex: Int) {
        nextButton.addDropShadow()
        if (currentIndex + 1 == numberOfItems(in: self.contentPagerView)) {
            nextButton.setImage(nil, for: .normal)
            nextButton.setTitle("M U L A I", for: .normal)
            nextButtonWidth.constant = 100
        } else {
            nextButton.setTitle("Selanjutnya", for: .normal)
            nextButtonWidth.constant = 50
        }
    }
}

extension WalkthroughView: FSPagerViewDataSource, FSPagerViewDelegate {
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return self.messageList.count
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: R.reuseIdentifier.walkthroughCellIdentifier.identifier, at: index) as! WalkthroughCell
        cell.contentView.layer.shadowRadius = 0
        cell.contentView.layer.shadowOpacity = 0
        let message = messageList[index]
        cell.setContent(text: message)
        return cell
    }
    
    //MARK:- FSPageViewDelegate
    func pagerViewWillEndDragging(_ pagerView: FSPagerView, targetIndex: Int) {
        self.handlePage(currentIndex: targetIndex)
    }
    
    func pagerViewDidScroll(_ pagerView: FSPagerView) {
        pageControl.progress = pagerView.scrollOffset
    }
}
