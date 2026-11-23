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

### In 식 유도 (슬라이드 11)
- Fick: 전자 flux F = −Dn·dn/dx,  전류밀도 Jn = (−q)·F = q·Dn·dn/dx
- In = AE·q·Dn·dnp/dx,  직선 분포 np(0) → np(W)=0 이므로 dnp/dx = −np(0)/W
- 음수 = 전류는 −x 방향 (컬렉터→이미터), 전자 이동과 반대. 크기 iC = AE·q·Dn·np(0)/W

### 확인문제 (W9-1)
1. vBE=0.7, vCB=−0.3 → 정의상 EBJ·CBJ 모두 순방향 = saturation
   (교재 4.1.4: CBJ 순방향 0.4 V 이하면 사실상 active처럼 동작, 15번 PDF에서 다룸)
2. β=50 → α=50/51≈0.980, iE=1 mA → iC≈0.980 mA, iB=iE/(β+1)≈19.6 μA
3. W 절반 → IS 2배 (IS ∝ 1/W).  iC 2배, iB1 그대로, iB2(=Qn/τb, Qn ∝ W) 절반
   → β는 2배 이상 증가 (β 식의 첫 항 1/2배, 둘째 항 1/4배)

### 교재 보충: β를 결정하는 것
- iB1 (베이스→이미터 정공 주입) = AE·q·Dp·ni²/(ND·Lp) · e^(vBE/VT)
- iB2 (베이스 재결합) = Qn/τb,  Qn = AE·q·W·np(0)/2
- β = 1 / [ (Dp/Dn)(NA/ND)(W/Lp) + W²/(2·Dn·τb) ]
- β↑ 조건: W 작게, NA(베이스) 낮게, ND(이미터) 높게
