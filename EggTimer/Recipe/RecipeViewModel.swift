//
//  RecipeViewModel.swift
//  EggTimer
//
//  Created by 김민지 on 2022/05/17.
//  레시피 화면 뷰 모델

import Foundation

final class RecipeViewModel {
    private let recipesSearchManager = RecipesSearchManager()
    
    var currentPage: Int = 0    // 지금 보여주고 있는 페이지
    let display: Int = 10       // 한 페이지에 보여줄 최대 개수
    
    var recipes: [Recipes] = []
    
    /// '삶은 계란 레시피' 키워드가 들어간 레시피의 개수
    var numOfRecipes: Int {
        return recipes.count
    }
    
    /// 해당 인덱스의 레시피 정보
    func recipeInfo(at index: Int) -> Recipes {
        return recipes[index]
    }

    /// 레시피 리스트 요청하기
    func requestRecipesList(completion: @escaping () -> Void) {
        recipesSearchManager.request(
            start: (currentPage * display) + 1,
            display: display
        ) { [weak self] newValue in
            guard let self = self else { return }
            
            self.recipes += newValue
            self.currentPage += 1
            completion()
        }
    }
}
