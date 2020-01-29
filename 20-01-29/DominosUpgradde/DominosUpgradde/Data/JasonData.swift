//
//  JasonData.swift
//  DominosUpgradde
//
//  Created by Hailey Lee on 2020/01/29.
//  Copyright © 2020 Hailey. All rights reserved.
//

import Foundation

// 실제로 Array와 Dictionary로 만든 코드이지 실제 json 데이터는 아니다
// 언젠가 json 파일을 이렇게 array, dict 이런 형식을 바꿔서 이용해야 한다.
let jsonData: Any =
  [
    [
      "category": "슈퍼시드",
      "products":
        [
          [
            "name": "글램핑 바비큐",
            "price": 35900
          ],
          [
            "name": "알로하 하와이안",
            "price": 25900
          ],
          [
            "name": "우리 고구마",
            "price": 31900
          ],
          [
            "name": "콰트로 치즈 퐁듀",
            "price": 25900
          ]
      ]
    ],
    [
      "category": "프리미엄",
      "products":
        [
          [
            "name": "더블크러스트 이베리코",
            "price": 34900
          ],
          [
            "name": "블랙앵거스 스테이크",
            "price": 25900
          ],
          [
            "name": "블랙타이거 슈림프",
            "price": 31900
          ],
          [
            "name": "와규 앤 비스테카",
            "price": 25900
          ],
          [
            "name": "직화 스테이크",
            "price": 25900
          ]
      ]
    ],
    [
      "category": "클래식",
      "products":
        [
          [
            "name": "포테이토",
            "price": 25900
          ],
          [
            "name": "슈퍼디럭스",
            "price": 25900
          ],
          [
            "name": "슈퍼슈프림",
            "price": 25900
          ],
          [
            "name": "베이컨체더치즈",
            "price": 25900
          ],
          [
            "name": "불고기",
            "price": 24900
          ],
          [
            "name": "페퍼로니",
            "price": 22900
          ]
      ]
    ],
    [
      "category": "사이드디시",
      "products":
        [
          [
            "name": "딸기 슈크림",
            "price": 25900
          ],
          [
            "name": "슈퍼곡물 치킨",
            "price": 25900
          ],
          [
            "name": "애플 크러스트 디저트",
            "price": 25900
          ],
          [
            "name": "치킨퐁듀 그라탕",
            "price": 25900
          ],
          [
            "name": "퀴노아 치킨 샐러드",
            "price": 24900
          ],
          [
            "name": "포테이토 순살치킨",
            "price": 22900
          ]
      ]
    ],
    [
      "category": "음료",
      "products":
        [
          [
            "name": "미닛메이드 스파클링 청포도",
            "price": 2300
          ],
          [
            "name": "스프라이트",
            "price": 2100
          ],
          [
            "name": "코카콜라",
            "price": 2000
          ],
          [
            "name": "코카콜라 제로",
            "price": 2100
          ]
      ]
    ],
    [
      "category": "피클소스",
      "products":
        [
          [
            "name": "갈릭 디핑 소스",
            "price": 200
          ],
          [
            "name": "스위트 칠리소스",
            "price": 300
          ],
          [
            "name": "우리 피클 L",
            "price": 800
          ],
          [
            "name": "우리 피클 M",
            "price": 500
          ],
          [
            "name": "핫소스",
            "price": 100
          ]
      ]
    ]
]
