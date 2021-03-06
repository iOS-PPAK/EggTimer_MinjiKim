//
//  BasicRecipeCell.swift
//  EggTimer
//
//  Created by 김민지 on 2022/05/17.
//  기본 레시피 화면(달걀 예쁘게 삶는 방법) 셀

import UIKit

final class BasicRecipeCell: UICollectionViewCell {
    static let identifier = "BasicRecipeCell"

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!

    private let data: [Int:[String]] = [
        0:["달걀 예쁘게 삶는 법 ➜", "노른자가 중앙에 오도록 예쁘게 삶아는 방법입니다~!"],
        1:["1. 상온에 미리 꺼내두기", "1시간 전에 달걀을 미리 꺼내주세요. 냉기를 뺀 후 삶아야 깨지지 않아요. 급한 경우 따뜻한 물로 씻어주세요."],
        2:["2. 센 불로 끓이기", "계란이 잠길 정도로 물을 붓고 소금과 식초 한 큰 술을 넣어주세요. 센 불에서 끓기 전까지 한 방향으로 저어주면 노른자가 중앙으로 와요."],
        3:["3. 중불로 줄이기", "물이 보글보글 끓기 시작하면 중불로 불을 낮춰주세요."],
        4:["4. 찬물로 식히기", "다 삶은 후에 달걀을 바로 찬물에 넣어주세요. 열을 식혀주면 껍질을 쉽게 깔 수 있어요."]
    ]

    func update(_ row: Int) {
        contentView.layer.cornerRadius = 40.0
        titleLabel.text = data[row]![0]
        contentLabel.text = data[row]![1]
    }
}
