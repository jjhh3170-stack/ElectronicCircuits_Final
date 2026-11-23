# 전자회로 공부 노트

## W9-1 (14_W9_Chapter4_1): BJT 구조와 active 모드 전류

### 동작 모드 (npn)
| 모드 | EBJ | CBJ | 용도 |
|---|---|---|---|
| Active | 순방향 | 역방향 | 증폭기 |
| Cutoff | 역방향 | 역방향 | 스위치 OFF |
| Saturation | 순방향 | 순방향 | 스위치 ON |

### 핵심 식
- iC = IS·e^(vBE/VT),  VT ≈ 25 mV,  vCB와 무관 (CBJ가 역방향인 한)
- iB = iC/β,  β 보통 50~200
- iE = iC + iB = iC(β+1)/β = (IS/α)·e^(vBE/VT)
- α = β/(β+1),  β = α/(1−α)   (β=100 → α≈0.990)
- np(0) = np0·e^(vBE/VT),  np0 = ni²/NA
- In = AE·q·Dn·dnp/dx = −AE·q·Dn·np(0)/W  (음수 = 전류가 −x 방향, 컬렉터→이미터)
- IS = AE·q·Dn·ni²/(NA·W)   [교재 보충]

### 교재 보충: β를 결정하는 것
- iB1 (베이스→이미터 정공 주입) = AE·q·Dp·ni²/(ND·Lp) · e^(vBE/VT)
- iB2 (베이스 재결합) = Qn/τb,  Qn = AE·q·W·np(0)/2
- β = 1 / [ (Dp/Dn)(NA/ND)(W/Lp) + W²/(2·Dn·τb) ]
- β↑ 조건: W 작게, NA(베이스) 낮게, ND(이미터) 높게
