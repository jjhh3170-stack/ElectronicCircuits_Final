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

---

## W9-2 (15_W9_Chapter4_2_mod): 전류관계 마무리, 실제구조, 포화, pnp

### IS (포화/척도 전류)
- IS = AE·q·Dn·np0/W = AE·q·Dn·ni²/(W·NA)
- W에 반비례, AE에 비례, 온도에 민감(5℃마다 2배). AE 2배 → IS·iC 2배 (current scaling)

### 보충: np0와 ni 온도식 (교재 1장)
- 질량작용 법칙: n·p = ni²(열평형). p형 베이스는 pp0≈NA → np0 = ni²/NA
- IS = AE·q·Dn·ni²/(W·NA) 에서 ni²는 np0=ni²/NA 대입으로 등장
- ni 온도 의존: ni² = B·T³·e^(−Eg/(kT))   (Si: Eg≈1.12eV, B≈7.3e15, k=8.62e-5 eV/K)
  - 지배항 e^(−Eg/kT): 밴드갭을 열로 넘는 효과, 온도에 지수적 민감
  - T³: 상태밀도 효과(보조)
  - IS ∝ ni² → BJT 전류 온도 민감(5℃마다 ≈2배), VBE ≈ −2mV/℃

### 대신호 등가모델 4종 (Fig 4.5) — 내용 동일, 표현만 다름
- (a) 전압제어, common-base: DE(IS/α), iC=IS·e^(vBE/VT)
- (b) 전류제어, common-base: DE, iC=α·iE
- (c) 전압제어, common-emitter: DB(IS/β), iC=IS·e^(vBE/VT)
- (d) 전류제어, common-emitter: DB, iC=β·iB
- large-signal model: vBE>0이면 크기 무관 성립 (스위칭/비선형 OK)

### Practice (IS=1e-15, β=100, iB=10μA, RC=3k, VCC=5V)
- VBE = VT·ln(iB/(IS/β)) = 25m·ln(1e-5/1e-17) = 25m·ln(1e12) ≈ 0.69 V
- iC = β·iB = 1 mA
- VCE = VCC − RC·iC = 5 − 3 = +2 V  (Vc 2V > Vb 0.69V → active ✓)
- 정전류원→저항: RB = (VCC−VBE)/iB = 4.31/10μ = 431 kΩ

### 실제 구조 (Fig 4.7)
- 컬렉터가 이미터를 감쌈 → α≈1. 비대칭(E·C 교환 불가). CBJ 면적 ≫ EBJ → ISC = 10~100×ISE

### 포화 모드
- active: vCB>0 (단, vCB≈−0.4V까지는 active 유지)
- saturation: vBC>0.4V → CB 순방향 다이오드 추가
  iC = IS·e^(vBE/VT) − ISC·e^(vBC/VT)
  iB = (IS/β)·e^(vBE/VT) + ISC·e^(vBC/VT)
- forced β = iC/iB < β
- 판별: ① vBC>0.4V  ② iC/iB<β
- VCE,sat = vBE − vBC;  edge ≈ 0.3V, deep ≈ 0.2V

### pnp (Fig 4.10~4.11)
- p-n-p, 주 캐리어 = 정공. EBJ 순방향 vEB>0, 지수항 e^(vEB/VT)
- iC=IS·e^(vEB/VT), iB=iC/β, iE=iC+iB. 모델은 npn과 다이오드·전류 방향만 반대

### 확인문제 (W9-2) — 사용자 풀이 대기
1. β=100, iC=2mA iB=0.1mA → forced β=20<100 → saturation
2. RC=5k → VCE=5−5×1=0V → VCE<0.3 불가, saturation (active 아님)
3. pnp active: vEB>0 (EBJ 순방향), vBC<0 즉 vCB>0 (CBJ 역방향)
