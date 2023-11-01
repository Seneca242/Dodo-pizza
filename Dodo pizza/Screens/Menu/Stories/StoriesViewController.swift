//
//  StoriesViewController.swift
//  Dodo pizza
//
//  Created by Dmitry Dmitry on 15.09.2023.
//

import UIKit

class StoriesViewController: UIViewController {
    
    var stories: [Stories] = []
    var currentIndex: Int = 0
    var timer: Timer?
    var progressBars: [UIProgressView] = []
    
    var didFinishLastStory: (() -> Void)?
    
    // UIImageView для отображения текущей истории
    let storyImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    // StackView для хранения прогресс-баров
    let progressBarStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        return stackView
    }()
    
    // Кнопка закрытия с крестиком
    let closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    init(stories: [Stories]) {
        self.stories = stories
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
        loadStory(at: currentIndex)
        
        // Добавлено: Настройка жестов
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        swipeLeft.direction = .left
        view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        swipeRight.direction = .right
        view.addGestureRecognizer(swipeRight)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        view.addGestureRecognizer(tap)
    }
    
    // Добавлено: Обработка свайпов
    @objc func handleSwipe(_ gesture: UISwipeGestureRecognizer) {
        timer?.invalidate()
        if gesture.direction == .left {
            loadNextStory()
        } else if gesture.direction == .right {
            loadPreviousStory()
        }
    }
    
    // Добавлено: Обработка тапов
    @objc func handleTap(_ gesture: UITapGestureRecognizer) {
        timer?.invalidate()
        loadNextStory()
    }
    
    
    func loadNextStory() {
        currentIndex += 1
        if currentIndex < stories.count {
            loadStory(at: currentIndex)
        } else {
            didFinishLastStory?() // Вызываем замыкание при завершении последней истории
        }
    }
    
    // Добавлено: Загрузка предыдущей истории
    func loadPreviousStory() {
        currentIndex -= 1
        if currentIndex >= 0 {
            loadStory(at: currentIndex)
        } else {
            // Закрыть или перейти к предыдущему баннеру
        }
    }
    
    // Добавлено: Загрузка истории по индексу
    func loadStory(at index: Int) {
        storyImageView.image = UIImage(named: stories[index].image)
        startProgressBar(at: index)
    }
    
    // Добавлено: Запуск прогресс-бара для истории по индексу
    func startProgressBar(at index: Int) {
        progressBars[index].progress = 0
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            self.progressBars[index].progress += 0.02 // 5 секунд = 0.02 за итерацию
            if self.progressBars[index].progress >= 1 {
                self.timer?.invalidate()
                self.loadNextStory()
            }
        }
    }
    
    // Добавлено: Настройка представлений и ограничений
    func setupViews() {
        view.addSubview(storyImageView)
        view.addSubview(progressBarStackView)
        view.addSubview(closeButton)
        
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        
        // Создание прогресс-баров
        stories.forEach { _ in
            let progressBar = UIProgressView(progressViewStyle: .bar)
            progressBar.trackTintColor = .lightGray
            progressBar.progressTintColor = .white
            progressBarStackView.addArrangedSubview(progressBar)
            progressBars.append(progressBar)
        }
    }
    
    func setupConstraints() {
        storyImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        closeButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.left.equalToSuperview().offset(10)
            make.width.height.equalTo(30)
        }
        
        progressBarStackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.left.equalTo(closeButton.snp.right).offset(10) // Исправлено: отступ от кнопки закрытия
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(2)
        }
        
        progressBars.forEach { progressBar in
            progressBar.snp.makeConstraints { make in
                make.height.equalTo(progressBarStackView)
            }
        }
    }
    
    @objc func closeButtonTapped() {
        timer?.invalidate()
        dismiss(animated: true, completion: nil)
    }
    
}

