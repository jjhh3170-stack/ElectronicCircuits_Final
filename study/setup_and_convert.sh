#!/usr/bin/env bash
# 새 세션에서 환경 복원: PyMuPDF 설치 + 슬라이드 PNG 렌더링
set -e
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
LIB="$ROOT/../.pylibs"
OUT="$ROOT/../png"
pip install --target="$LIB" pymupdf -q || true
mkdir -p "$OUT"
PYTHONPATH="$LIB" python3 -W ignore - "$ROOT" "$OUT" <<'EOF'
import sys, glob, os, pymupdf
root, out = sys.argv[1], sys.argv[2]
for f in sorted(glob.glob(os.path.join(root, '*.pdf'))):
    name = os.path.basename(f)[:2]
    d = pymupdf.open(f)
    for i, p in enumerate(d):
        p.get_pixmap(dpi=80).save(f'{out}/{name}_{i+1:02d}.png')
    print(os.path.basename(f), d.page_count, 'pages')
EOF
