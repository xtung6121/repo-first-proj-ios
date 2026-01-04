
import UIKit

final class HomeViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var lbViewNavigation: UILabel!
    @IBOutlet weak var bgContainerView: UIImageView!
    @IBOutlet weak var btnHorizontal: UIButton!
    @IBOutlet weak var btnNav: UIButton!
    @IBOutlet weak var bgViewHeader: UIView!
    @IBOutlet weak var bgImageLayer: UIImageView!
    @IBOutlet weak var bgViewHeaderLabel: UIView!
    @IBOutlet weak var viewContent: UIView!
    @IBOutlet weak var searchTextField: MTextField!
    @IBOutlet weak var viewNaviagation: UIView!
    @IBOutlet weak var scrollContainer: UIScrollView!
    @IBOutlet weak var lbStackviewHeader: UILabel!
    @IBOutlet weak var scLbStackViewHeader: UILabel!
    @IBOutlet weak var imageDiscountView: UIImageView!
    
    @IBOutlet private weak var categoriesCollectionView: UICollectionView!
    @IBOutlet private weak var bestSellerCollectionView: UICollectionView!
    @IBOutlet private weak var recommendCollectionView: UICollectionView!
    
    
    private var categories: [Category] = Category.getDummyDatas()
    private var bestSellers: [Category] = Category.getDummyDatas()
    private var recommendFood: [Category] = Category.getDummyDatas()
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBackground()
        setupHeaderLabels()
        setupSearchTextField()
        setupCollectionViews()
        setupDiscountView()
        setupViewNavigation()
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        navigationController?.isNavigationBarHidden = true
        overrideUserInterfaceStyle = .light
    }
    
    private func setupBackground() {
        bgContainerView.backgroundColor = ColorSet.yellowPrimary.color
        bgImageLayer.image = UIImage(named: "Frame 6")
        bgViewHeader.backgroundColor = .clear
        bgViewHeaderLabel.backgroundColor = .clear
        scrollContainer.backgroundColor = .clear
        viewContent.backgroundColor = .clear
    }
    
    private func setupHeaderLabels() {
        lbStackviewHeader.text = "Good Morning"
        lbStackviewHeader.font = .systemFont(ofSize: 30, weight: .bold)
        lbStackviewHeader.textColor = .white
        
        scLbStackViewHeader.text = "Rise and shine! It's Breakfast Time"
        scLbStackViewHeader.textColor = .red
        scLbStackViewHeader.font = .systemFont(ofSize: 12, weight: .medium)
    }
    
    private func setupSearchTextField() {
        searchTextField.configView(placeHolder: "Search", textColor: .black, font: .systemFont(ofSize: 50))
    }
    
    private func setupViewNavigation() {
        viewNaviagation.backgroundColor = .clear
        lbViewNavigation.text = "Best Seller"
        btnNav.setTitle("View", for: .normal)
        btnHorizontal.setImage(UIImage(named: "Path"), for: .normal)
        
    }
    
    private func setupDiscountView() {
        imageDiscountView.image = UIImage(named: "Frame 71")
    }
    
    // MARK: - Collection Views Setup
    private func setupCollectionViews() {
        configureCategoriesCollectionView()
        configureBestSellersCollectionView()
        configureRecommendCollectionView()
    }
    
    private func configureCategoriesCollectionView() {
        categoriesCollectionView.register(
            UINib(nibName: "CategoriesCollectionCell", bundle: nil),
            forCellWithReuseIdentifier: "CategoriesCollectionCell"
        )
        
        categoriesCollectionView.delegate = self
        categoriesCollectionView.dataSource = self
        categoriesCollectionView.backgroundColor = .clear
        categoriesCollectionView.showsHorizontalScrollIndicator = false
    }
    
    private func configureBestSellersCollectionView() {
        bestSellerCollectionView.register(
            UINib(nibName: "BestSellerCollectionCell", bundle: nil),
            forCellWithReuseIdentifier: "BestSellerCollectionCell"
        )
        
        bestSellerCollectionView.delegate = self
        bestSellerCollectionView.dataSource = self
        bestSellerCollectionView.backgroundColor = .clear
        bestSellerCollectionView.showsHorizontalScrollIndicator = false
    }
    
    private func configureRecommendCollectionView() {
        recommendCollectionView.register(
            UINib(nibName: "RecommendCollectionCell", bundle: nil),
            forCellWithReuseIdentifier: "RecommendCollectionCell"
        )
        
        recommendCollectionView.delegate = self
        recommendCollectionView.dataSource = self
        recommendCollectionView.backgroundColor = .clear
        recommendCollectionView.showsHorizontalScrollIndicator = false
    }
    

}



extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func setupCategoryCell(index: IndexPath, collectionView: UICollectionView) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesCollectionCell", for: index ) as! CategoriesCollectionCell
        
        cell.btnCollection.setTitle("name", for: .normal)
        cell.imgViewCollection.image = UIImage(named: "vegan")
        return cell
    }
    func setupBestSellerCell(index: IndexPath, collectionView: UICollectionView) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BestSellerCollectionCell", for: index) as! BestSellerCollectionCell
        
        cell.imageCollectionView?.image = UIImage(named: "Rectangle 133") ?? UIImage(systemName: "Rectangle 133")
        return cell
    }
    
    func setupRecommendFood(index: IndexPath, collectionView: UICollectionView) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommendCollectionCell", for: index) as! RecommendCollectionCell
        
        cell.uiimageView.image = UIImage(named: "Photo Pizza")
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case categoriesCollectionView:
            return categories.count

        case bestSellerCollectionView:
            return bestSellers.count

        case recommendCollectionView:
            return recommendFood.count

        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case categoriesCollectionView:
            return setupCategoryCell(index: indexPath, collectionView: collectionView)
        case bestSellerCollectionView:
            return setupBestSellerCell(index: indexPath, collectionView: collectionView)
        case recommendCollectionView:
            return  setupRecommendFood(index: indexPath, collectionView: collectionView)
        default:
            return UICollectionViewCell()

        }
    }
}

    



extension HomeViewController {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        // Lấy item được chọn từ dataSource tương ứng
        let dataSource = collectionView.dataSource as? UICollectionViewDiffableDataSource<Int, Category>
        guard let category = dataSource?.itemIdentifier(for: indexPath) else { return }
        
        let type: String
        if collectionView == categoriesCollectionView {
            type = "Categories"
        } else if collectionView == bestSellerCollectionView {
            type = "Best Sellers"
        } else {
            type = "Recommend"
        }
        
        print("Selected from \(type): \(category.category)")
    }
}

